#include <iostream>
#include <ros/ros.h>
#include <ros/time.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/Twist.h>

#include <stdio.h>

#include "fslidar.h"

using namespace std;

int publish_lidar_data(
    ros::Publisher &pub,
    std::string frame_id,
    LidarConstant ldConst,
    ros::Time start_scan_time,
    double scan_duration,
    LaserDataNode *node,
    int actual_cnt,
    int align_cnt)
{
    sensor_msgs::LaserScan msg;
    msg.header.frame_id = frame_id;
    msg.header.stamp = start_scan_time;
    msg.angle_min = ldConst.angle_min;
    msg.angle_max = ldConst.angle_max;
    msg.angle_increment = ldConst.angle_increment;
    msg.scan_time = scan_duration;
    msg.time_increment = scan_duration / align_cnt;
    msg.range_min = ldConst.range_min;
    msg.range_max = ldConst.range_max;
    msg.ranges.resize(align_cnt);
    msg.intensities.resize(align_cnt);

    int j;
    int j_min = 0;
    int j_max = 0;
    int index;
    int offset = align_cnt / 2;
    for (int i=0;i<align_cnt;i++)
    {
        j_min = j_max;
        j_max = (i+1)*actual_cnt/align_cnt - 1;
        for (j=j_min;j<j_max;j++)
        {
            //printf("j: %d, j_min: %d, j_max: %d\n", j, j_min, j_max);
            index = align_cnt - offset - i;
            if (index < 0)
            {
                index = align_cnt + index;
            }
            if ((node+j)->distance > 1 && (node+j)->distance < 3500)
            {
                //printf("distance: %d\n", (node+j)->distance);
                msg.ranges[index] = (node+j)->distance * ldConst.kDistance;
                msg.intensities[index] = 47.0;
                break;
            }
            //msg.ranges[index] = 0.0;
            msg.ranges[index] = std::numeric_limits<float>::infinity();
            msg.intensities[index] = 0.0;
        }
    }
    pub.publish(msg);
    return 0;
}

int main(int argc, char **argv)
{

    ROS_INFO("init!");
    ros::init(argc, argv, "fslidar");
    ros::NodeHandle nh;
    ros::NodeHandle nh_private("~");

    int last_anl=-1, align_number=0, sample_rate=0, rotational_speed=0, index=0;
    std::string frame_id;
    std::string dev_path;
    bool origin_data;
    ros::Time start_scan_time = ros::Time::now();
    double scan_duration;

    LaserDataNode *ldn_array = new LaserDataNode [5760];
    memset((void *)ldn_array, 0, 5760*sizeof(LaserDataNode));
    LaserDataNode *ldn = new LaserDataNode [256];
    LaserDataNode *ldn_tmp;
    int ldn_cnt = 0;


    nh_private.param<int>("sample_rate", sample_rate, 5000);
    nh_private.param<int>("rotational_speed", rotational_speed, 5);
    align_number = sample_rate / rotational_speed;
    // align_number = 400;
    nh_private.param<std::string>("frame_id", frame_id, "/lidar_frame");
    nh_private.param<std::string>("dev_path", dev_path, "/dev/ttyUSB0");
    nh_private.param<bool>("origin_data", origin_data, false);
    std::string scan_topic_str;
    nh_private.param<std::string>("scan_topic", scan_topic_str, "/scan");
    ros::Publisher pub = nh.advertise<sensor_msgs::LaserScan>(scan_topic_str.c_str(), 1000);

    fslidar fsld(align_number);
    ROS_INFO("fslidar turnning on!");
    fsld.init(dev_path.c_str());
    if (fsld.turnOn() == false)
    {
        ROS_INFO("failed!");
        return 0;
    }
    ROS_INFO("done!");
    while (ros::ok())
    {
        ldn_cnt = fsld.getOnePoint(ldn, origin_data);
        for(int i=0;i<ldn_cnt;i++)
        {
            ldn_tmp = ldn + i;
            if (ldn_tmp->angle == 5768)
            {
                //ROS_INFO("published!");
                scan_duration = (ros::Time::now() - start_scan_time).toSec() * 0.001;
                publish_lidar_data(
                    pub,
                    frame_id,
                    fsld.ldConst,
                    start_scan_time,
                    scan_duration,
                    ldn_array,
                    5760,
                    align_number);
                memset((void *)ldn_array, 0, 5760*sizeof(LaserDataNode));
                last_anl = -1;
                start_scan_time = ros::Time::now();
            }
            else
            {
                if(ldn_tmp->angle > last_anl)
                {
                    (ldn_array + ldn_tmp->angle)->angle = ldn_tmp->angle;
                    (ldn_array + ldn_tmp->angle)->distance = ldn_tmp->distance;
                    last_anl = ldn_tmp->angle;
                }
            }
        }
    }
    fsld.turnOff();

    return 0;
}
