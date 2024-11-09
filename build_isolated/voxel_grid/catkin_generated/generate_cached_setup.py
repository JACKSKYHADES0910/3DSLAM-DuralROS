# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/noetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/noetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/xyz/autolabor/devel_isolated/urg_node;/home/xyz/autolabor/devel_isolated/tl740d;/home/xyz/autolabor/devel_isolated/stereo_image_proc;/home/xyz/autolabor/devel_isolated/spacenav_node;/home/xyz/autolabor/devel_isolated/slam_gmapping;/home/xyz/autolabor/devel_isolated/rviz_navigation_tools;/home/xyz/autolabor/devel_isolated/rviz_keyboard_twist;/home/xyz/autolabor/devel_isolated/rviz_imu_plugin;/home/xyz/autolabor/devel_isolated/rviz_autolabor_calibration;/home/xyz/autolabor/devel_isolated/rtk_tracking;/home/xyz/autolabor/devel_isolated/rslidar_sdk;/home/xyz/autolabor/devel_isolated/rplidar_ros;/home/xyz/autolabor/devel_isolated/ps3joy;/home/xyz/autolabor/devel_isolated/pico_zense_driver;/home/xyz/autolabor/devel_isolated/path_rviz_plugin;/home/xyz/autolabor/devel_isolated/path_server;/home/xyz/autolabor/devel_isolated/gmapping;/home/xyz/autolabor/devel_isolated/openslam_gmapping;/home/xyz/autolabor/devel_isolated/navigation;/home/xyz/autolabor/devel_isolated/navi_multi_goals_pub_rviz_plugin;/home/xyz/autolabor/devel_isolated/multi_car_goal;/home/xyz/autolabor/devel_isolated/marvelmind;/home/xyz/autolabor/devel_isolated/amcl;/home/xyz/autolabor/devel_isolated/map_server;/home/xyz/autolabor/devel_isolated/location_fusion;/home/xyz/autolabor/devel_isolated/ldlidar_stl_ros;/home/xyz/autolabor/devel_isolated/kinect2_viewer;/home/xyz/autolabor/devel_isolated/kinect2_calibration;/home/xyz/autolabor/devel_isolated/kinect2_bridge;/home/xyz/autolabor/devel_isolated/kinect2_registration;/home/xyz/autolabor/devel_isolated/joystick_drivers;/home/xyz/autolabor/devel_isolated/joy_to_twist;/home/xyz/autolabor/devel_isolated/joy;/home/xyz/autolabor/devel_isolated/image_view;/home/xyz/autolabor/devel_isolated/image_rotate;/home/xyz/autolabor/devel_isolated/image_publisher;/home/xyz/autolabor/devel_isolated/image_proc;/home/xyz/autolabor/devel_isolated/image_pipeline;/home/xyz/autolabor/devel_isolated/iai_kinect2;/home/xyz/autolabor/devel_isolated/fake_localization;/home/xyz/autolabor/devel_isolated/depth_image_proc;/home/xyz/autolabor/devel_isolated/ch104m;/home/xyz/autolabor/devel_isolated/cartographer_rviz;/home/xyz/autolabor/devel_isolated/cartographer_ros;/home/xyz/autolabor/devel_isolated/cartographer_initialpose;/home/xyz/autolabor/devel_isolated/cartographer_ros_msgs;/home/xyz/autolabor/devel_isolated/camera_calibration;/home/xyz/autolabor/devel_isolated/autolabor_test_launch;/home/xyz/autolabor/devel_isolated/autolabor_simulation_object;/home/xyz/autolabor/devel_isolated/autolabor_simulation_lidar;/home/xyz/autolabor/devel_isolated/autolabor_simulation_stage;/home/xyz/autolabor/devel_isolated/autolabor_simulation_location;/home/xyz/autolabor/devel_isolated/autolabor_simulation_base;/home/xyz/autolabor/devel_isolated/autolabor_pro1_driver;/home/xyz/autolabor/devel_isolated/autolabor_navigation_launch;/home/xyz/autolabor/devel_isolated/autolabor_keyboard_control;/home/xyz/autolabor/devel_isolated/autolabor_description;/home/xyz/autolabor/devel_isolated/autolabor_canbus_driver;/opt/ros/noetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/xyz/autolabor/devel_isolated/voxel_grid/env.sh')

output_filename = '/home/xyz/autolabor/build_isolated/voxel_grid/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
