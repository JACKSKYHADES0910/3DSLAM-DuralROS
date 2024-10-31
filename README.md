**视频展示** [建图定位导航(Youtube)](https://www.youtube.com/watch?v=1bbiSgneRYA)
# 目录
1. [3DSLAM-DuralROS概述](#1-3dslam-duralros)
   - 1.1 [硬件参数](#11-硬件参数)
   - 1.2 [准备工作](#12-准备工作)
   - 1.3 [Autoware 部署 AWSIM 联合仿真](#13-autoware-部署-awsim联合仿真)
2. [实车部署](#2-实车部署)
   - 2.1 [建图](#21-实车建图)
   - 2.2 [定位](#22-实车定位)
   - 2.3 [导航](#23-实车导航)




# 1. 3DSLAM-DuralROS概述
3DSLAM-DuralROS 是一款针对机器人操作系统（ROS1 和 ROS2）进行优化的先进SLAM（同步定位与地图构建）解决方案。该系统以AutoLabor M1机器人底盘为基础，设计出适用于室内室外的高度可靠的**导航**和**避障**技术。3DSLAM-DuralROS 不仅能够进行高效的**地图建构**和**定位**，还能在复杂多变的环境中实现精确导航和**实时避障**，满足现代自动化需求。

## 1.1 硬件参数

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

## 1.2 准备工作
  **准备工作部分是根据本人实操所记录的流程，观看者可根据所需内容选取，非必要部分可以跳过！**
1. 安装系统 Ubuntu 20.04 + 系统分区</br>
   参考链接:[Windows10+Ubuntu20.04双系统 惠普暗影精灵OMEN](https://blog.csdn.net/Robert_Q/article/details/115842915)
      >根目录：</br> 
      / 主分区 250G </br> 
      /boot：逻辑分区 10G </br> 
      swap：交换分区， 32G </br> 
      EFI：启动程序：1G </br> 
      /home: 逻辑分区，剩下的707G </br> 

2. 下载**对应Ubtuntu系统**版本(20.04)[AutoLabor代码(ROS1-noetic)](http://www.autolabor.com.cn/download)</br>
   由于autolabor所支持的设备太过于老旧以及多器械的驱动未曾更新并存在被删库的风险，步骤2方法会出现诸多不便的操作，包括并不限于手搓驱动，以及自己实时调参。
3. (推荐)国内大神“鱼香ROS”一键配置Ubuntu操作系统各种配置
   - 可通过terminal直接安装[主页｜鱼香ROS](https://fishros.org.cn/forum/topic/20/%E5%B0%8F%E9%B1%BC%E7%9A%84%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E7%B3%BB%E5%88%97)
   - 安装说明：[FishROS 安装 GitHub 仓库](https://github.com/fishros/install)

    - 一键安装指令
    
        ```bash
        wget http://fishros.com/install -O fishros && . fishros
        ```
4. 安装autoware.ai 和 autoware.universe</br>
   参考文档：
   - autoware.ai可以从gitub直接拉包： [autoware.ai](https://github.com/autowarefoundation/autoware_ai)
   - autoware.universe比较复杂，需要配置nvidia/tensort/cudnn等配置，可以参看CSDN大佬编写文档： [autoware.universe](https://blog.csdn.net/zardforever123/article/details/132528899)
5. 安装autolabor以及调参cmd_vel
   - 准备另一台电脑，下载autolabor官方网站制作的`.iso`文件安装系统，拷贝`catkin_ws`文件并备份到U盘中
   - 下载连接： [AutolaborOS-24.04-amd64.iso (Ubuntu18.04 ROS Melodic)](http://www.autolabor.com.cn/download?hmsr=gwstastics&hmpl=os&hmcu=24.04)</br>
   - 将`catkin_ws`拷贝至所运行的主机中，此文件运行在`ROS1-neotic`环境下运行 


## 1.3 Autoware部署AWSIM联合仿真
   **参考文档**: [AWSIM官方安装文档](https://github.com/tier4/AWSIM/blob/v1.0.1/docs/GettingStarted/QuickStartDemo/index.md)

1. 进入 `.bashrc` 
    ```bash
    sudo gedit ./bashrc

2. 在`.bashrc`文件中添加**AWSIM**所需要的环境变量
    ```bash
    export ROS_LOCALHOST_ONLY=1
    export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
    
    if [ ! -e /tmp/cycloneDDS_configured ]; then
        sudo sysctl -w net.core.rmem_max=2147483647
        sudo ip link set lo multicast on
        touch /tmp/cycloneDDS_configured
    fi
3. 安装所需依赖
   ```bash
   sudo apt update
   ```
   ```bash
   sudo apt install libvulkan1
   ````
4. 下载 `AWSIM_vXXX.zip` 并解压</br>
   `AWSIM_v1.0.1.zip`: [AWSIM Demo for ubuntu](https://github.com/tier4/AWSIM/releases/download/v1.0.1/AWSIM_v1.0.1.zip)</br>
   修改文件权限</br>
   ![修改图片权限](https://github.com/tier4/AWSIM/raw/v1.0.1/docs/GettingStarted/QuickStartDemo/Image_1.png)</br>
   在`Download`路径打开`terminal`
   ```bash
   sudo apt install unzip
   sudo unzip AWSIM_v1.0.1
   ```
5. 打开AWSIM仿真器
   ```bash
   ./<path to AWSIM folder>/AWSIM.x86_64
   ```
   查看`topic`订阅情况
   ```
   ros2 topic list
   ```
6. 下载AWSIM在autoware上面运行的地图</br>
     [AWSIM_autoware_map](https://github.com/tier4/AWSIM/releases/download/v1.0.0/nishishinjuku_autoware_map.zip)</br>
     同上步骤解压，放在与`AWSIM.x86_64`启动项同级目录位置

   - 启动AWISM仿真器
     ```bash
     ./<path to AWSIM folder>/AWSIM.x86_64
     ```

   - 启动autoware.universe(`map`地址要指向AWSIM地图路径)
     ```bash
     # 新开一个终端
     cd autoware_universe
     source install/setup.bash
     ros2 launch autoware_launch e2e_simulator.launch.xml vehicle_model:=sample_vehicle sensor_model:=awsim_sensor_kit map_path:=<your mapfile location>
     ```
     ![Autoware.universe与AWISM联合仿真](https://github.com/tier4/AWSIM/raw/v1.0.1/docs/GettingStarted/QuickStartDemo/Image_Initial.png)</br>


## 建图</br>
在建图过程当中，我们选择了`Lego-loam`和`ndt_map`两种建图方式，其中`Lego-loam`是左手坐标系建图，`ndt_map`是右手坐标系建图，**autoware.universe需要右手坐标系建图**，所以我们选择`ndt_map`来进行建图
1. Lego-loam</br>
    - 一种轻量级和地面优化的激光雷达里程计和**建图**方法，用于实时估计地面车辆的六自由度姿态
    - 参考文档：Github安装 [LeGO-LOAM](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM)
2. ndt_map</br>
    - autoware.universe选择`ndt_map`
    - NDT_MAP 是受到Autoware的启发，结合了ndt_mapping和lego_loam的回环检测技术，能够创建出精细且动态更新的环境模型
    -  参考文档：Github安装 [ndt_map](https://github.com/jyakaranda/ndt_map)


