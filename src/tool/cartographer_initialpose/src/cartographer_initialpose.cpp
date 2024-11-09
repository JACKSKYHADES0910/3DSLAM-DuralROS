#include "cartographer_initialpose/cartographer_initialpose.h"

#include "cartographer_ros_msgs/GetTrajectoryStates.h"
#include "cartographer_ros_msgs/FinishTrajectory.h"
#include "cartographer_ros_msgs/StartTrajectory.h"

namespace autolabor_tools {

    CartographerInitialpose::CartographerInitialpose() {
        ros::NodeHandle private_node("~");
        private_node.param("configuration_directory", dir_path_, std::string(""));
        private_node.param("configuration_basename", configure_file_, std::string(""));

        if (dir_path_.empty() || configure_file_.empty()) {
            ROS_ERROR("configuration_directory OR configuration_basename cannot be empty!");
            return;
        }
    }

    void CartographerInitialpose::initPoseReceived(
            const geometry_msgs::PoseWithCovarianceStamped_<std::allocator<void>>::ConstPtr &msg) {
        cartographer_ros_msgs::GetTrajectoryStates states;
        if (get_trajectory_states_client_.call(states) && states.response.status.code == 0) {
            int32_t trajectory_id = states.response.trajectory_states.trajectory_id.back();
            uint8_t trajectory_state = states.response.trajectory_states.trajectory_state.back();

            if (trajectory_state == 0) {
                cartographer_ros_msgs::FinishTrajectory finishTrajectory;
                finishTrajectory.request.trajectory_id = trajectory_id;
                finish_trajectory_client_.call(finishTrajectory);
            }

            cartographer_ros_msgs::StartTrajectory startTrajectory;
            startTrajectory.request.configuration_directory = dir_path_;
            startTrajectory.request.configuration_basename = configure_file_;
            startTrajectory.request.use_initial_pose = true;
            startTrajectory.request.initial_pose = msg->pose.pose;
            startTrajectory.request.relative_to_trajectory_id = 0;
            start_trajectory_client_.call(startTrajectory);
        }
    }


    void CartographerInitialpose::run() {
        init_pose_sub_ = nh_.subscribe("initialpose", 1, &CartographerInitialpose::initPoseReceived, this);

        get_trajectory_states_client_ = nh_.serviceClient<cartographer_ros_msgs::GetTrajectoryStates>(
                "get_trajectory_states");
        finish_trajectory_client_ = nh_.serviceClient<cartographer_ros_msgs::FinishTrajectory>("finish_trajectory");
        start_trajectory_client_ = nh_.serviceClient<cartographer_ros_msgs::StartTrajectory>("start_trajectory");

        ros::spin();
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "cartographer_initialpose");
    autolabor_tools::CartographerInitialpose cartographerInitialpose;
    cartographerInitialpose.run();
    return 0;
}