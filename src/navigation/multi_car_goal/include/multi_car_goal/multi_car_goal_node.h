#ifndef SRC_MULTI_CAR_GOAL_NODE_H
#define SRC_MULTI_CAR_GOAL_NODE_H

#include "string"
#include "deque"

#include "ros/ros.h"

#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>


#include "move_base_msgs/MoveBaseActionFeedback.h"
#include "geometry_msgs/PoseStamped.h"

namespace autolabor_util {
    class MultiCarGoalNode {
    public:
        MultiCarGoalNode();

        ~MultiCarGoalNode();

        void run();

    private:
        void feedbackReceived(const move_base_msgs::MoveBaseActionFeedback::ConstPtr &feedback);

        void pubGoalCallback(const ros::TimerEvent &event);

        std::deque<geometry_msgs::PoseStamped > trajectory_;

//        tf::Stamped<tf::Pose> map_trans_;

        geometry_msgs::TransformStamped map_trans_;


        ros::NodeHandle nh_;
        tf2_ros::Buffer tfBuffer_;
        tf2_ros::TransformListener tfListener_;

//        tf::TransformListener tf_;
        ros::Subscriber feedback_sub_;
        ros::Publisher goal_pub_;
        ros::Timer pub_goal_timer_;

        int rate_;
        double distance_from_front_;
        std::string feedback_topic_, goal_topic_, goal_frame_;
    };
}


#endif //SRC_MULTI_CAR_GOAL_NODE_H
