#ifndef SRC_CARTOGRAPHER_INITIALPOSE_H
#define SRC_CARTOGRAPHER_INITIALPOSE_H

#include "ros/ros.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"

#include "tf/tf.h"

#include "string"

namespace autolabor_tools {
    class CartographerInitialpose {
    public:
        CartographerInitialpose();

        void run();
    private:
        void initPoseReceived(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr &msg);

    private:
        ros::NodeHandle nh_;

        ros::Subscriber init_pose_sub_;

        ros::ServiceClient get_trajectory_states_client_;
        ros::ServiceClient finish_trajectory_client_;
        ros::ServiceClient start_trajectory_client_;

        std::string dir_path_;
        std::string configure_file_;

    };
}


#endif //SRC_CARTOGRAPHER_INITIALPOSE_H
