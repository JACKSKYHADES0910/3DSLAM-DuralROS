#ifndef SRC_NAVIGATION_TOOLS_PANEL_H
#define SRC_NAVIGATION_TOOLS_PANEL_H

#include "ros/ros.h"
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>

#include "rviz/panel.h"
#include "geometry_msgs/Twist.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
#include "geometry_msgs/PoseStamped.h"

#include "QString"
#include "QComboBox"
#include "QPushButton"

namespace autolabor_plugin {

    class NavigationToolsPanel : public rviz::Panel {
    Q_OBJECT
    public:
        NavigationToolsPanel(QWidget *parent = 0);

        virtual void load(const rviz::Config &config);

        virtual void save(rviz::Config config) const;

    protected Q_SLOTS:

        void updatePrefix();

        void prefixChanged(const QString &index);

    protected:
        QComboBox *robot_prefix_combo_;

        QPushButton *robot_prefix_button_;

    private:
        void cmdVelReceived(const geometry_msgs::Twist::ConstPtr &msg);

        void goalReceived(const geometry_msgs::PoseStamped::ConstPtr &msg);

        void initPoseReceived(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr &msg);


    private:

        ros::NodeHandle nh_;

        tf2_ros::Buffer tfBuffer_;
        tf2_ros::TransformListener tfListener_;

//        tf2_ros::Buffer tfBuffer;
//        tf2_ros::TransformListener tfListener(tfBuffer);
        ros::Subscriber cmd_vel_sub_;
        ros::Subscriber goal_sub_;
        ros::Subscriber init_pose_sub_;

        bool pub_flag_;
        ros::Publisher cmd_vel_pub_;
        ros::Publisher goal_pub_;
        ros::Publisher init_pose_pub_;

    };

}


#endif //SRC_NAVIGATION_TOOLS_PANEL_H
