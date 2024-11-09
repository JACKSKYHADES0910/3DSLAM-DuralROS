#include "rviz_autolabor_calibration/autolabor_calibration_panel.h"

#include "QVBoxLayout"
#include "QHBoxLayout"
#include "QLabel"

namespace autolabor_plugin {

    AutolaborCalibrationPanel::AutolaborCalibrationPanel(QWidget *parent) : start_distance_(false),
                                                                            start_angle_(false),
                                                                            sum_distance_(0.0),
                                                                            sum_angle_(0.0),
                                                                            first_odom_(true) {
        QVBoxLayout *panel_layout = new QVBoxLayout;
        // diameter
        QVBoxLayout *diameter_layout = new QVBoxLayout;

        QHBoxLayout *diameter_disp_layout = new QHBoxLayout;
        diameter_disp_layout->addWidget(new QLabel("直径 : "));
        diameter_from_edit_ = new QLineEdit("0.25");
//        diameter_from_edit_->setEnabled(false);
        diameter_disp_layout->addWidget(diameter_from_edit_);
        diameter_disp_layout->addWidget(new QLabel(" -> "));
        diameter_to_edit_ = new QLineEdit();
        diameter_to_edit_->setReadOnly(true);
        diameter_disp_layout->addWidget(diameter_to_edit_);
        diameter_layout->addLayout(diameter_disp_layout);

        QHBoxLayout *diameter_input_layout = new QHBoxLayout;
        diameter_input_layout->addWidget(new QLabel("距离(米) : "));
        distance_expected_edit_ = new QLineEdit("1");
        diameter_input_layout->addWidget(distance_expected_edit_);
        diameter_input_layout->addWidget(new QLabel("里程计(米) : "));
        distance_actually_edit_ = new QLineEdit();
        distance_actually_edit_->setEnabled(false);
        diameter_input_layout->addWidget(distance_actually_edit_);
        diameter_layout->addLayout(diameter_input_layout);

        QHBoxLayout *diameter_button_layout = new QHBoxLayout;
        diameter_start_button_ = new QPushButton("开始标定");
        diameter_button_layout->addWidget(diameter_start_button_);
        diameter_cal_button_ = new QPushButton("计算结果");
        diameter_cal_button_->setEnabled(false);
        diameter_button_layout->addWidget(diameter_cal_button_);
        diameter_layout->addLayout(diameter_button_layout);
        panel_layout->addLayout(diameter_layout);


        QPushButton *split_line = new QPushButton();
        split_line->setFixedHeight(1);
        split_line->setFocusPolicy(Qt::NoFocus);
        panel_layout->addWidget(split_line);

        // param
        QVBoxLayout *param_layout = new QVBoxLayout;

        QHBoxLayout *param_disp_layout = new QHBoxLayout;
        param_disp_layout->addWidget(new QLabel("系数 : "));
        param_from_edit_ = new QLineEdit("0.8");
//        param_from_edit_->setEnabled(false);
        param_disp_layout->addWidget(param_from_edit_);
        param_disp_layout->addWidget(new QLabel(" -> "));
        param_to_edit_ = new QLineEdit();
        param_to_edit_->setReadOnly(true);
        param_disp_layout->addWidget(param_to_edit_);
        param_layout->addLayout(param_disp_layout);

        QHBoxLayout *param_input_layout = new QHBoxLayout;
        param_input_layout->addWidget(new QLabel("角度(度) : "));
        angle_expected_edit_ = new QLineEdit("360");
        param_input_layout->addWidget(angle_expected_edit_);
        param_input_layout->addWidget(new QLabel("里程计(度) : "));
        angle_actually_edit_ = new QLineEdit();
        angle_actually_edit_->setEnabled(false);
        param_input_layout->addWidget(angle_actually_edit_);
        param_layout->addLayout(param_input_layout);

        QHBoxLayout *param_button_layout = new QHBoxLayout;
        param_start_button_ = new QPushButton("开始标定");
        param_button_layout->addWidget(param_start_button_);
        param_cal_button_ = new QPushButton("计算结果");
        param_cal_button_->setEnabled(false);
        param_button_layout->addWidget(param_cal_button_);
        param_layout->addLayout(param_button_layout);
        panel_layout->addLayout(param_layout);

        setLayout(panel_layout);

        connect(diameter_start_button_, SIGNAL(pressed()), this, SLOT(startDistance()));
        connect(diameter_cal_button_, SIGNAL(pressed()), this, SLOT(calDistance()));
        connect(param_start_button_, SIGNAL(pressed()), this, SLOT(startAngle()));
        connect(param_cal_button_, SIGNAL(pressed()), this, SLOT(calAngle()));

        connect(diameter_from_edit_, SIGNAL(textEdited(const QString &)), this,
                SLOT(checkDistanceEmpty(const QString &)));
        connect(param_from_edit_, SIGNAL(textEdited(const QString &)), this, SLOT(checkAngleEmpty(const QString &)));

        odom_sub_ = nh_.subscribe<nav_msgs::Odometry>("/odom", 1, &AutolaborCalibrationPanel::odomCallback, this);
    }

    void AutolaborCalibrationPanel::odomCallback(const nav_msgs::Odometry_<std::allocator<void>>::ConstPtr &odom_msg) {
        if (first_odom_) {
            tf::poseMsgToTF(odom_msg->pose.pose, last_odom_);
            first_odom_ = false;
            return;
        }

        tf::poseMsgToTF(odom_msg->pose.pose, current_odom_);
        tf::Transform transform = last_odom_.inverse() * current_odom_;

        if (start_distance_) {
            sum_distance_ += transform.getOrigin().x();
            distance_actually_edit_->setText(std::to_string(sum_distance_).c_str());
        }

        if (start_angle_) {
            sum_angle_ += (tf::getYaw(transform.getRotation()) * 180 / M_PI);
            angle_actually_edit_->setText(std::to_string(sum_angle_).c_str());
        }

        last_odom_ = current_odom_;

    }

    void AutolaborCalibrationPanel::load(const rviz::Config &config) {
        Panel::load(config);
    }

    void AutolaborCalibrationPanel::save(rviz::Config config) const {
        Panel::save(config);
    }

    void AutolaborCalibrationPanel::startDistance() {
        start_distance_ = true;
        sum_distance_ = 0.0;
        diameter_start_button_->setEnabled(false);
        diameter_cal_button_->setEnabled(true);
    }

    void AutolaborCalibrationPanel::calDistance() {
        start_distance_ = false;
        double diameter_org = diameter_from_edit_->text().toDouble();
        double distance_expected = distance_expected_edit_->text().toDouble();
        double distance_actually = distance_actually_edit_->text().toDouble();
        double diameter_real = diameter_org * distance_expected / distance_actually;
        diameter_to_edit_->setText(std::to_string(diameter_real).c_str());
        diameter_start_button_->setEnabled(true);
        diameter_cal_button_->setEnabled(false);
    }

    void AutolaborCalibrationPanel::startAngle() {
        start_angle_ = true;
        sum_angle_ = 0.0;
        param_start_button_->setEnabled(false);
        param_cal_button_->setEnabled(true);
    }

    void AutolaborCalibrationPanel::calAngle() {
        start_angle_ = false;
        double param_org = param_from_edit_->text().toDouble();
        double angle_expected = angle_expected_edit_->text().toDouble();
        double angle_actually = angle_actually_edit_->text().toDouble();
        double param_real = param_org * angle_actually / angle_expected;
        param_to_edit_->setText(std::to_string(param_real).c_str());
        param_start_button_->setEnabled(true);
        param_cal_button_->setEnabled(false);
    }

    void AutolaborCalibrationPanel::checkDistanceEmpty(const QString &text) {
        ROS_INFO_STREAM("checkDistanceEmpty" << text.isEmpty());
        if (!start_distance_){
            diameter_start_button_->setEnabled(!text.isEmpty());
        }
    }

    void AutolaborCalibrationPanel::checkAngleEmpty(const QString &text) {
        ROS_INFO_STREAM("checkAngleEmpty" << text.isEmpty());
        if (!start_angle_) {
            param_start_button_->setEnabled(!text.isEmpty());
        }
    }


}

#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(autolabor_plugin::AutolaborCalibrationPanel, rviz::Panel)