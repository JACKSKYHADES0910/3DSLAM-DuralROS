#include "multi_car_goal/multi_car_goal_node.h"

namespace autolabor_util {

    MultiCarGoalNode::MultiCarGoalNode() : tfListener_(tfBuffer_) {
        ros::NodeHandle private_node("~");
        private_node.param("feedback_topic", feedback_topic_, std::string("/move_base/feedback"));
        private_node.param("goal_topic", goal_topic_, std::string("/move_base_simple/goal"));
        private_node.param("goal_frame", goal_frame_, std::string("map"));
        private_node.param("rate", rate_, 5);
        private_node.param("distance_from_front", distance_from_front_, 0.5);
    }

    MultiCarGoalNode::~MultiCarGoalNode() {

    }

    void MultiCarGoalNode::feedbackReceived(const move_base_msgs::MoveBaseActionFeedback::ConstPtr &feedback) {
        trajectory_.push_back(feedback->feedback.base_position);
    }

    void MultiCarGoalNode::pubGoalCallback(const ros::TimerEvent &event) {
        if (!trajectory_.empty() && trajectory_.size() > 1) {
            double sum = 0.0;
            bool flag = false;
            std::deque<geometry_msgs::PoseStamped>::iterator iter;
            for (iter = trajectory_.end() - 1; iter != trajectory_.begin() + 1; iter--) {
                sum += tf2::tf2Distance(
                        tf2::Vector3(iter->pose.position.x, iter->pose.position.y, iter->pose.position.z),
                        tf2::Vector3((iter - 1)->pose.position.x, (iter - 1)->pose.position.y,
                                     (iter - 1)->pose.position.z));
                if (sum > distance_from_front_) {
                    flag = true;
                    break;
                }
            }

            if (flag) {
                geometry_msgs::PoseStamped msg;
                ros::Time now = ros::Time(0);
                if (tfBuffer_.canTransform(goal_frame_, iter->header.frame_id, now, ros::Duration(4.0))) {
                    iter->header.stamp = now;
                    tfBuffer_.transform(*iter, msg, goal_frame_, ros::Duration(4.0));
                    goal_pub_.publish(msg);
                    while (trajectory_.begin() != iter - 1) {
                        trajectory_.pop_front();
                    }
                } else {
                    ROS_ERROR_STREAM("can`t find transform from " << iter->header.frame_id << " to " << goal_frame_);
                    return;
                }
            }
        }
    }

    void MultiCarGoalNode::run() {
        feedback_sub_ = nh_.subscribe(feedback_topic_, 10, &MultiCarGoalNode::feedbackReceived, this);
        goal_pub_ = nh_.advertise<geometry_msgs::PoseStamped>(goal_topic_, 10);
        pub_goal_timer_ = nh_.createTimer(ros::Duration(1.0 / rate_), &MultiCarGoalNode::pubGoalCallback, this);
        ros::spin();
    }


}

int main(int argc, char **argv) {
    ros::init(argc, argv, "multi_car_goal_node");
    autolabor_util::MultiCarGoalNode multi_car_goal_node;
    multi_car_goal_node.run();
    return 0;
}