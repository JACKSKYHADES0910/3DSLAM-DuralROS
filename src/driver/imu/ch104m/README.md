# ch104m

CH104M IMU ROS 驱动, 支持 AP1 M1 平台，支持正装倒装



参数说明





```
<node pkg="ch104m" type="ch104m" name="imu" output="screen">
    <param name="port" value="/dev/box_5" type="string" />  #串口
    <param name="baud" value="115200" type="int" /> #波特率
    <param name="odomtopic" value="/odom" type="string"/> #订阅的里程计话题
    <param name="fake_acc" value="true"   type="bool" /> #使用里程计伪造加速度
    <param name="reverse_install" value="true"  type="bool" /> #是否为倒装模式（Z 向下，Y 轴向车尾）
    <param name="lio_sam" value="true"  type="bool" /> #是否在使用 liosam
</node>
```



