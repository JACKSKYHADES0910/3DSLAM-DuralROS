# FSD_F10_lidarsensor_rosdriver


1)git clone https://github.com/Harrybot2/FSD_F10_lidarsensor_rosdriver
cd FSD_F10_lidar_sensor
tar -xzvf wr_fslidar.tar.gz and get the file fold of "wr_fslidar"
Clone this "wr_fslidar" file folder to your catkin's workspace src folder
2)Running catkin_make to build
3)connect the lidar sensor with your computer, then type: 
sudo chmod 777 /dev/ttyUSB0
4)go inside your catkin workspace, such as "catkin_fslidar".
  cd catkin_fslidar
  source devel/setup.bash
  then run roscore
5) Opern another terminal and repeat to go inside your catkin_fslidar
   source devel/setup.bash
   roslaunch wr_fslidar fslidar_view.launch
6) Then you will see the lidar sensor message is showing on the rviz and enjoy it.

# Contact person:
# Harry Wu
# Harrybot@aliyun.com