#!/bin/bash

if [ ! -e "/dev/autolabor_pro1" ]; then
  zenity --no-wrap --error --text="底层连接失败，请检查机器人是否连接至上位机，并确保上位机控制开关打开以及急停按钮未按下。"
  exit 0
fi

if [ ! -e "/dev/box_1" ]; then
  zenity --no-wrap --error --text="单线激光雷达（前）连接失败，请检查雷达是否连接至上位机。"
  exit 0
fi

if [ ! -e "/dev/box_2" ]; then
  zenity --no-wrap --error --text="单线激光雷达（后）连接失败，请检查雷达是否连接至上位机>。"
  exit 0
fi

if [ ! -e "/dev/box_3" ]; then
  zenity --no-wrap --error --text="RTK连接失败，请检查RTK是否连接至上位机>。"
  exit 0
fi
source /home/autolabor/.alconfig/sethardware.bash
source /opt/autolabor/ros/catkin_ws/devel/setup.bash
IP=`ifconfig wlan0 | grep "inet 地址:" | awk '{print $2}' | cut -c 8-`

if [ -z "$IP" ]; then
  IP="127.0.0.1"
fi

export ROS_MASTER_URI=http://$IP:11311/
export ROS_IP=$IP

roslaunch rtk_tracking rtk_tracking.launch
