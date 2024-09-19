# 3DSLAM-DuralROS
以AutoLabor M1为底盘，开发ROS1和ROS2双版本，进行SLAM建图-定位-导航-避障

## 概述


## 硬件参数

**主机参数**

<table>
 <tr>
    <td>CPU</td>
    <td align="right">i7-10750H</td>
  </tr>
  <tr>
    <td>GPU</td>
    <td align="right">RTX-2070Ti</td>
  </tr>
  <tr>
    <td>System</td>
    <td align="right">Ubuntu 20.04</td>
  </tr>
  <tr>
    <td>ROS1</td>
    <td align="right">Noetic</td>
  </tr>
  <tr>
    <td>ROS2</td>
    <td align="right">Galactic</td>
  </tr>
</table>

**硬件参数**
1. 底盘: [AutoLabor M1](http://www.autolabor.com.cn/usedoc/m1/navigationKit/receivingGuide/inspection "AutoLabor底盘使用手册")
2. 雷达: [速腾聚创Rslidar16线雷达](https://gitee.com/xiaoxinslam/ros_rslidar "rslidar16-Gitee仓库")
3. 惯导: [CH104M](https://github.com/hipnuc/products/tree/master "hipnuc-CH104M-Github仓库")
4. 相机: [Kinetic V2](https://learn.microsoft.com/en-us/windows/apps/design/devices/kinect-for-windows "Kinetic V2 for windows")
5. 上位机: [惠普暗影精灵](https://www.omen.com/cn/zh/laptops.html "HP-OMEN官网")

## 记录
1. 安装系统 Ubuntu 20.04 + 系统分区</br>
   参考链接:[Windows10+Ubuntu20.04双系统 惠普暗影精灵OMEN](https://blog.csdn.net/Robert_Q/article/details/115842915)
>根目录：</br> 
/ 主分区 250G </br> 
/boot：逻辑分区 10G </br> 
swap：交换分区， 32G </br> 
EFI：启动程序：1G </br> 
/home: 逻辑分区，剩下的707G </br> 

2. 下载**对应Ubtuntu系统**版本(20.04)[AutoLabor代码(ROS1-noetic)](http://www.autolabor.com.cn/download)
3. (非必选)国内大神“鱼香ROS”一键配置Ubuntu操作系统各种配置，可通过terminal直接安装[主页｜鱼香ROS](https://fishros.org.cn/forum/topic/20/%E5%B0%8F%E9%B1%BC%E7%9A%84%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E7%B3%BB%E5%88%97)
   - 安装说明：[FishROS 安装 GitHub 仓库](https://github.com/fishros/install)

  - 一键安装指令

    ```bash
    wget http://fishros.com/install -O fishros && . fishros
    ```






