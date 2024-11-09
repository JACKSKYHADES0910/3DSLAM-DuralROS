#include "rviz_navigation_tools/navigation_tools_panel.h"

#include "ros/ros.h"
#include "ros/datatypes.h"

#include "QVBoxLayout"
#include "QLabel"

namespace autolabor_plugin {

    NavigationToolsPanel::NavigationToolsPanel(QWidget *parent) : rviz::Panel(parent),
                                                                  pub_flag_(false),
                                                                  tfListener_(tfBuffer_){
        QVBoxLayout *panel_layout = new QVBoxLayout;

        QHBoxLayout *prefix_layout = new QHBoxLayout;
        QLabel *ns_label = new QLabel("机器人 : ");
        ns_label->setFixedWidth(60);
        prefix_layout->addWidget(ns_label);
        robot_prefix_combo_ = new QComboBox();
        prefix_layout->addWidget(robot_prefix_combo_);
        robot_prefix_button_ = new QPushButton("刷新");
        robot_prefix_button_->setFixedWidth(60);
        prefix_layout->addWidget(robot_prefix_button_);

        panel_layout->addLayout(prefix_layout);

        setLayout(panel_layout);

        cmd_vel_sub_ = nh_.subscribe("/cmd_vel", 1, &NavigationToolsPanel::cmdVelReceived, this);
        goal_sub_ = nh_.subscribe("/move_base_simple/goal", 1, &NavigationToolsPanel::goalReceived, this);
        init_pose_sub_ = nh_.subscribe("/initialpose", 1, &NavigationToolsPanel::initPoseReceived, this);


        updatePrefix();
        prefixChanged(robot_prefix_combo_->currentText());

        connect(robot_prefix_button_, SIGNAL(pressed()), this, SLOT(updatePrefix()));
        connect(robot_prefix_combo_, SIGNAL(currentIndexChanged(const QString &)), this,
                SLOT(prefixChanged(const QString &)));
    }


    void NavigationToolsPanel::save(rviz::Config config) const {
        rviz::Panel::save(config);
    }

    void NavigationToolsPanel::load(const rviz::Config &config) {
        rviz::Panel::load(config);
    }

    void NavigationToolsPanel::updatePrefix() {
        QStringList items;
        robot_prefix_combo_->clear();
        ros::V_string nodes;
        ros::master::getNodes(nodes);
        for (const auto &node : nodes) {
            std::size_t index = node.find("/move_base");
            if (index != std::string::npos) {
                if (index == 0) {
                    items.push_back("/");
                } else {
                    items.push_back(node.substr(1, index - 1).c_str());
                }
            }
        }
        robot_prefix_combo_->addItems(items);
    }

    void NavigationToolsPanel::prefixChanged(const QString &prefix) {
        if (prefix == "/") {
            pub_flag_ = false;
            cmd_vel_pub_.shutdown();
            goal_pub_.shutdown();
            init_pose_pub_.shutdown();
        } else {
            pub_flag_ = true;
            cmd_vel_pub_ = nh_.advertise<geometry_msgs::Twist>((prefix + "/cmd_vel").toStdString(), 1);
            goal_pub_ = nh_.advertise<geometry_msgs::PoseStamped>((prefix + "/move_base_simple/goal").toStdString(), 1);
            init_pose_pub_ = nh_.advertise<geometry_msgs::PoseWithCovarianceStamped>(
                    (prefix + "/initialpose").toStdString(), 1);
        }
    }

    void NavigationToolsPanel::cmdVelReceived(const geometry_msgs::Twist_<std::allocator<void>>::ConstPtr &msg) {
        if (pub_flag_) {
            cmd_vel_pub_.publish(msg);
        }
    }

    void NavigationToolsPanel::goalReceived(const geometry_msgs::PoseStamped_<std::allocator<void>>::ConstPtr &msg) {
        if (pub_flag_) {
            std::string target_frame = (robot_prefix_combo_->currentText() + "/map").toStdString();
            if (msg->header.frame_id != target_frame) {
                geometry_msgs::PoseStamped out_msg;
                ROS_INFO_STREAM(target_frame << " " << msg->header.frame_id);
                if (tfBuffer_.canTransform(target_frame, msg->header.frame_id, msg->header.stamp, ros::Duration(4.0))) {
                    try{
                        tfBuffer_.transform(*msg, out_msg, target_frame, ros::Duration(4.0));
                    }catch (...) {
                        return;
                    }
                } else {
                    ROS_ERROR_STREAM("can`t find transform from " << msg->header.frame_id << " to " << target_frame);
                    return;
                }
                goal_pub_.publish(out_msg);
            } else {
                goal_pub_.publish(msg);
            }
        }
    }

    void
    NavigationToolsPanel::initPoseReceived(
            const geometry_msgs::PoseWithCovarianceStamped_<std::allocator<void>>::ConstPtr &msg) {
        if (pub_flag_) {
            std::string target_frame = (robot_prefix_combo_->currentText() + "/map").toStdString();
            if (msg->header.frame_id != target_frame) {
                geometry_msgs::PoseWithCovarianceStamped out_msg;
                if (tfBuffer_.canTransform(target_frame, msg->header.frame_id, msg->header.stamp, ros::Duration(4.0))) {
                    tfBuffer_.transform(*msg, out_msg, target_frame, ros::Duration(4.0));
                    init_pose_pub_.publish(out_msg);
                } else {
                    ROS_ERROR_STREAM("can`t find transform from " << msg->header.frame_id << " to " << target_frame);
                    return;
                }
            } else {
                init_pose_pub_.publish(msg);
            }
        }
    }
}

#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(autolabor_plugin::NavigationToolsPanel, rviz::Panel)