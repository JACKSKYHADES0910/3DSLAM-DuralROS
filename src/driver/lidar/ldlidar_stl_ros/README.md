# 乐动雷达驱动（修改版)

支持 LD19 LD06 乐动激光雷达

编译方法与其他包相同。

主要修改部分在原驱动只支持过滤掉部分角度雷达数据， 当需要过滤部分处于多段时 （例如 330 至 0 度 ，0 度至 180 度， 180 度至 210 度）时，原有的根据角度大小值判断过滤的方法无法做到。 

为了弥补这一缺陷，增加新的过滤功能，新功能与原驱动作用相反，使用角度值过滤的形式只保留指定范围内的数据，例如上面的情况可写成，保留  210-330 度范围内数据。



## 参数介绍



典型的 launch 文件如下:

```xml
<param name="product_name" value="LDLiDAR_LD19"/>
  <param name="topic_name" value="scan"/>
  <param name="port_name" value ="/dev/box_1"/>
  <param name="frame_id" value="base_laser"/>
  <!-- Set laser scan directon: -->
  <!--    1. Set counterclockwise, example: <param name="laser_scan_dir" type="bool" value="true"/> -->
  <!--    2. Set clockwise,        example: <param name="laser_scan_dir" type="bool" value="false"/> -->
  <param name="laser_scan_dir" type="bool" value="true"/>
  <!-- Angle crop setting, Mask data within the set angle range -->
  <!--    1. Enable angle crop fuction: -->
  <!--       1.1. enable angle crop,  example: <param name="enable_angle_crop_func" type="bool" value="true"/> -->
  <!--       1.2. disable angle crop, example: <param name="enable_angle_crop_func" type="bool" value="false"/> -->
  <param name="enable_angle_crop_func" type="bool" value="false"/>
  <!--    2. Angle cropping interval setting, The distance and intensity data within the set angle range will be set to 0 --> 
  <!--       angle >= "angle_crop_min" and angle <= "angle_crop_max", unit is degress -->
  <param name="angle_crop_min" type="double" value="135.0"/>
  <param name="angle_crop_max" type="double" value="225.0"/>

  <param name="enable_angle_keep" type="bool" value="true">
  <param name="angle_keep_min" type="double" value="135.0"/>
  <param name="angle_keep_max" type="double" value="225.0"/>
```

**topic_name** 数据发布的话题 

**port_name** 雷达串口地址 

**frame_id** 数据坐在坐标系

**laser_scan_dir** 雷达扫描的方向 true: 逆时针方向  false:顺时针方向

**enable_angle_crop_func** 删除部分角度雷达数据 true:启用 false:关闭

**angle_crop_min** 删除部分的最小值， 大于此角度， 小于 angle_crop_max 角度的数据，将被过滤掉

**enable_angle_keep** 保持部分雷达数据 true:启动 false:关闭

**angle_keep_min** 保留数据的最小角度， angle_keep_max 保留数据的最大角度，在此范围外的数据将被过滤掉

**注意：angle_keep 功能执行顺序先于 angle_crop。 如要联合使用请注意这一点。** 

