#include <boost/thread.hpp>

#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>

geometry_msgs::Twist current;
sensor_msgs::Joy last_msg;
boost::mutex twist_mutex;
ros::Publisher pub;
double rate;
double linear_scale, angular_scale;
double linear_min, linear_max, linear_step;
double angular_min, angular_max, angular_step;
bool send_flag;

void joyCallback(const sensor_msgs::Joy::ConstPtr &msg)
{

    if (last_msg.axes.size() && last_msg.buttons.size())
    {
        if (msg->buttons[0] - last_msg.buttons[0] == 1.0)
        {
            angular_scale = std::max(angular_scale - angular_step, angular_min);
        }
        else if (msg->buttons[1] - last_msg.buttons[1] == 1.0)
        {
            linear_scale = std::max(linear_scale - linear_step, linear_min);
        }
        else if (msg->buttons[2] - last_msg.buttons[2] == 1.0)
        {
            angular_scale = std::min(angular_scale + angular_step, angular_max);
        }
        else if (msg->buttons[3] - last_msg.buttons[3] == 1.0)
        {
            linear_scale = std::min(linear_scale + linear_step, linear_max);
        }
        else if (msg->buttons[4] - last_msg.buttons[4] == 1.0)
        {
            send_flag = false;
        }
        else if (msg->buttons[5] - last_msg.buttons[5] == 1.0)
        {
            send_flag = true;
        }
        else if (msg->buttons[8] - last_msg.buttons[8] == 1.0)
        {
            linear_scale = linear_min;
            angular_scale = angular_min;
        }
        else if (msg->buttons[9] - last_msg.buttons[9] == 1.0)
        {
            linear_scale = linear_max;
            angular_scale = angular_max;
        }
    }

    geometry_msgs::Twist twist;
    twist.linear.x = (msg->axes[5] ? msg->axes[5] : msg->axes[1]) * linear_scale;
    twist.angular.z = (msg->axes[4] ? msg->axes[4] : msg->axes[0]) * angular_scale;
    twist.linear.x = msg->axes[1]*linear_max;
     twist.angular.z =  msg->axes[3]*angular_max;
     ROS_INFO("x : %f, angle : %f", twist.linear.x, twist.angular.z);

    twist_mutex.lock();
    current = twist;
    last_msg = *msg;
    twist_mutex.unlock();
}

void twistCallback(const ros::TimerEvent &)
{
    if (send_flag)
    {
        pub.publish(current);
    }
    else
    {
        current.linear.x = 0;
        current.angular.z = 0;
        pub.publish(current);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "joy_to_twist");
    ros::NodeHandle node;
    ros::NodeHandle private_node("~");

    private_node.param("linear_min", linear_min, 0.2);
    private_node.param("linear_max", linear_max, 2.0);
    private_node.param("linear_step", linear_step, 0.2);

    private_node.param("angular_min", angular_min, 0.5);
    private_node.param("angular_max", angular_max, 4.0);
    private_node.param("linear_step", angular_step, 0.2);

    private_node.param("rate", rate, 30.0);

    linear_scale = linear_min;
    angular_scale = angular_min;
    send_flag = true;

    pub = node.advertise<geometry_msgs::Twist>("cmd_vel", 50);
    ros::Timer send_twist_timer = node.createTimer(ros::Duration(1.0 / rate), twistCallback);
    ros::Subscriber sub = node.subscribe<sensor_msgs::Joy>("/joy", 1, &joyCallback);
    ros::spin();
    return 0;
}
