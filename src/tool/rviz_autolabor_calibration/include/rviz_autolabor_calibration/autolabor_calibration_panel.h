#ifndef SRC_AUTOLABOR_CALIBRATION_PANEL_H
#define SRC_AUTOLABOR_CALIBRATION_PANEL_H

#include "ros/ros.h"
#include "tf/tf.h"
#include "rviz/panel.h"
#include "nav_msgs/Odometry.h"

#include "QLineEdit"
#include "QPushButton"
#include "QString"

namespace autolabor_plugin {
    class AutolaborCalibrationPanel : public rviz::Panel {
    Q_OBJECT
    public:
        AutolaborCalibrationPanel(QWidget *parent = 0);

        virtual void load(const rviz::Config &config);

        virtual void save(rviz::Config config) const;

    protected Q_SLOTS:

        void startDistance();

        void calDistance();

        void startAngle();

        void calAngle();

        void checkDistanceEmpty(const QString &text);

        void checkAngleEmpty(const QString &text);

    protected:
        QLineEdit *diameter_from_edit_, *diameter_to_edit_, *distance_expected_edit_, *distance_actually_edit_;
        QPushButton *diameter_start_button_, *diameter_cal_button_;

        QLineEdit *param_from_edit_, *param_to_edit_, *angle_expected_edit_, *angle_actually_edit_;
        QPushButton *param_start_button_, *param_cal_button_;

    private:
        void odomCallback(const nav_msgs::Odometry::ConstPtr &odom_msg);

    private:
        ros::NodeHandle nh_;
        ros::Subscriber odom_sub_;

        tf::Pose last_odom_, current_odom_;
        bool first_odom_;
        bool start_distance_, start_angle_;
        double sum_distance_, sum_angle_;

    };
}


#endif //SRC_AUTOLABOR_CALIBRATION_PANEL_H
