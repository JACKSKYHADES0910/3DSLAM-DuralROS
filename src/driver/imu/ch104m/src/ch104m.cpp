#include <unistd.h>
#include <eigen3/Eigen/Core>
#include "ros/ros.h"
#include "serial/serial.h"
#include "sensor_msgs/Imu.h"
#include "tf2/LinearMath/Quaternion.h"
#include <ch104m/Imu_0x91_msg.h>
#include <ch104m/Imu_data_package.h>
#include <signal.h>
#include "ch_serial.h"
#include <stdint.h>
#include <nav_msgs/Odometry.h>
#define GRA_ACC      (9.8)
#define DEG_TO_RAD   (0.01745329222)
#define BUF_SIZE     1024

using namespace std;
static raw_t raw;

static int frame_rate;
static int frame_count;
static uint8_t buf[2048];

static bool odomInitized=false;
ros::Subscriber odometrySubscriber;
static nav_msgs::Odometry  lastOdometry;
static double odometryLinearAccX=0;
static double odometryLinearAccY=0;
static double odometryLinearAccZ=0;
static string odomTopic;
static bool fake_acc;
static bool reverse_install;
static bool lio_sam;


void timer(int sig)
{
    if(SIGALRM == sig)
    {
        frame_rate = frame_count;
        frame_count = 0;
        alarm(1);
    }
}
void convert_to_msg(raw_t *data,sensor_msgs::Imu& msg)
{
    int num=data->nimu - 1;
    msg.header.frame_id = "imu_link";
    msg.header.stamp = ros::Time::now();

    tf2::Quaternion q;

    Eigen::Vector3d acc;
    Eigen::Vector3d angle_vel;
    Eigen::Vector3d rot;

    if (lio_sam)
    {
        if (reverse_install)
        {

            acc <<  Eigen::Vector3d(-data->imu[num].acc[1]*GRA_ACC,-data->imu[num].acc[0]*GRA_ACC,-data->imu[num].acc[2]*GRA_ACC);

            angle_vel << Eigen::Vector3d (data->imu[num].gyr[1]*DEG_TO_RAD,-data->imu[num].gyr[0]*DEG_TO_RAD,-data->imu[num].gyr[2]*DEG_TO_RAD);

            rot <<  Eigen::Vector3d((180+data->imu[num].eul[0])*DEG_TO_RAD, (data->imu[num].eul[1])*DEG_TO_RAD, (data->imu[num].eul[2])*DEG_TO_RAD);

            //针对 m1，lio_sam 中使用的倒装方式,(出线向车尾,安装面向下)

        }else
        {

            acc <<  Eigen::Vector3d(-data->imu[num].acc[1]*GRA_ACC,data->imu[num].acc[0]*GRA_ACC,data->imu[num].acc[2]*GRA_ACC);

            angle_vel << Eigen::Vector3d (-data->imu[num].gyr[1]*DEG_TO_RAD,data->imu[num].gyr[0]*DEG_TO_RAD,data->imu[num].gyr[2]*DEG_TO_RAD);

            rot <<  Eigen::Vector3d(-data->imu[num].eul[0]*DEG_TO_RAD, data->imu[num].eul[1]*DEG_TO_RAD, data->imu[num].eul[2]*DEG_TO_RAD);

            //针对 ap1,lio_sam 中使用的正装方式,(出线向车尾,安装面向下)
        }

    }else
    {
        if (reverse_install)
        {

            acc<<Eigen::Vector3d (-data->imu[num].acc[1]*GRA_ACC,-data->imu[num].acc[0]*GRA_ACC,-data->imu[num].acc[2]*GRA_ACC);

            angle_vel<<Eigen::Vector3d (data->imu[num].gyr[1]*DEG_TO_RAD,data->imu[num].gyr[0]*DEG_TO_RAD,-data->imu[num].gyr[2]*DEG_TO_RAD);

            rot<< Eigen::Vector3d ( -data->imu[num].eul[1]*DEG_TO_RAD, -data->imu[num].eul[0]*DEG_TO_RAD, -data->imu[num].eul[2]*DEG_TO_RAD);

            //针对在 m1,cartographer中使用的倒装方式 （出线向车尾，安装面向上)，由于 cartographer 中urdf 不生效，所以需要在这里进行处理

        }else
        {
            acc<<Eigen::Vector3d (data->imu[num].acc[0]*GRA_ACC,data->imu[num].acc[1]*GRA_ACC,data->imu[num].acc[2]*GRA_ACC);

            angle_vel<<Eigen::Vector3d (data->imu[num].gyr[0]*DEG_TO_RAD,data->imu[num].gyr[1]*DEG_TO_RAD,data->imu[num].gyr[2]*DEG_TO_RAD);

            rot<< Eigen::Vector3d ( data->imu[num].eul[0]*DEG_TO_RAD, -data->imu[num].eul[1]*DEG_TO_RAD, data->imu[num].eul[2]*DEG_TO_RAD);

            //正装 按照IMU标识安装，也就是不考虑安装角度，使用 urdf 的定义的安装位子
        }
    }


//    rot <<  Eigen::Vector3d(0, 0, 0);

    q.setRPY(rot.x(),rot.y(),rot.z());

    msg.orientation.x = q.getX();
    msg.orientation.y = q.getY();
    msg.orientation.z = q.getZ();
    msg.orientation.w = q.getW();


    msg.angular_velocity.x = angle_vel.x();
    msg.angular_velocity.y = angle_vel.y();
    msg.angular_velocity.z = angle_vel.z();


    if (fake_acc)
    {
        msg.linear_acceleration.x = odometryLinearAccX;
        msg.linear_acceleration.y = odometryLinearAccY;
        msg.linear_acceleration.z = GRA_ACC;

    }else
    {
        msg.linear_acceleration.x =acc.x();
        msg.linear_acceleration.y =acc.y();
        msg.linear_acceleration.z =acc.z();
    }




// FOR DEBUG
//    ROS_INFO_STREAM("IMU ACC:" );
//    ROS_INFO_STREAM("x:"<< std::to_string(acc.x()) );
//    ROS_INFO_STREAM("y:"<<std::to_string(acc.y()));
//    ROS_INFO_STREAM("z:"<<std::to_string(acc.z()));
//    ROS_INFO_STREAM("Odom ACC:");
//    ROS_INFO_STREAM("x:"<<std::to_string( msg.linear_acceleration.x));
//    ROS_INFO_STREAM("y:"<<std::to_string( msg.linear_acceleration.y));
//    ROS_INFO_STREAM("z:"<<std::to_string( msg.linear_acceleration.z));
//
//    ROS_INFO_STREAM("IMU gyro:");
//    ROS_INFO_STREAM("x:"<<std::to_string(angle_vel.x()));
//    ROS_INFO_STREAM("y:"<<std::to_string(angle_vel.y()));
//    ROS_INFO_STREAM("z:"<<std::to_string(angle_vel.z()));
//
//    ROS_INFO_STREAM("IMU roll pitch yaw:");
//    ROS_INFO_STREAM("x:"<<std::to_string(rot.x()));
//    ROS_INFO_STREAM("y:"<<std::to_string(rot.y()));
//    ROS_INFO_STREAM("z:"<<std::to_string(rot.z()));


}

void wheelOdometryHandler(const nav_msgs::Odometry odometry)
{


    if (odomInitized==false)
    {
        lastOdometry=odometry;

        odomInitized=true;

        return;

    }


//    ROS_INFO_STREAM("current speed:"<<std::to_string(odometry.twist.twist.linear.x));

    double detlaT= odometry.header.stamp.toSec() - lastOdometry.header.stamp.toSec();

    odometryLinearAccX= (odometry.twist.twist.linear.x - lastOdometry.twist.twist.linear.x) / detlaT;
    odometryLinearAccY= (odometry.twist.twist.linear.y - lastOdometry.twist.twist.linear.y) / detlaT;
    odometryLinearAccZ= (odometry.twist.twist.linear.z - lastOdometry.twist.twist.linear.z) / detlaT;


}


int main(int argc, char **argv)
{
  // Set up ROS.
  int baud;
  string port;
  ros::init(argc, argv, "ch104m");
  ros::NodeHandle nh;
  ros::NodeHandle private_node("~");
  private_node.param<string>("port", port, "/dev/ttyUSB0");
  private_node.param<int>("baud", baud, 115200);
  private_node.param<string>("odomtopic",odomTopic,"wheel_odom");
  private_node.param("fake_acc",fake_acc,false);
  private_node.param("reverse_install",reverse_install,false);
  private_node.param("lio_sam",lio_sam,false);


  serial::Serial serial(port, baud, serial::Timeout::simpleTimeout(5000));
  ros::Publisher publisher = nh.advertise<sensor_msgs::Imu>("imu", 1);
  odometrySubscriber=nh.subscribe<nav_msgs::Odometry>(odomTopic,10,wheelOdometryHandler);



    serial::Serial sp;

    serial::Timeout to = serial::Timeout::simpleTimeout(100);

    sp.setPort(port);

    sp.setBaudrate(baud);

    sp.setTimeout(to);

    signal(SIGALRM,timer);

    try
    {
        sp.open();
    }
    catch(serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port.");
        return -1;
    }

    if(sp.isOpen())
    {
        ROS_INFO_STREAM("/dev/ttyUSB0 is opened.");
    }
    else
    {
        return -1;
    }

    alarm(1);

    ros::Rate loop_rate(400);
    ch104m::Imu_0x91_msg imu_0x91_msg;

    int rev = 0;

    while(ros::ok())
    {
        size_t num = sp.available();
        if(num!=0)
        {
            uint8_t buffer[BUF_SIZE];

            if(num > BUF_SIZE)
                num = BUF_SIZE;

            num = sp.read(buffer, num);
            if(num > 0)
            {
                imu_0x91_msg.header.stamp = ros::Time::now();
                imu_0x91_msg.header.frame_id = "imu_link";

                for (int i = 0; i < num; i++)
                {
                    rev = ch_serial_input(&raw, buffer[i]);

                    if(raw.item_code[raw.nitem_code - 1] != KItemGWSOL)
                    {
                        if(rev)
                        {
                            frame_count++;
                            sensor_msgs::Imu msg;
                            convert_to_msg(&raw,msg);
                            publisher.publish(msg);
                            ros::spinOnce();
                        }
                    }


                }
            }
        }

        loop_rate.sleep();
    }

    sp.close();

    return 0;
}

