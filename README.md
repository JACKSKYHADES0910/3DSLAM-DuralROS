**视频展示** [建图定位导航(Youtube)](https://www.youtube.com/watch?v=1bbiSgneRYA)
# 目录
1. [3DSLAM-DuralROS概述](#1-3dslam-duralros)
   - 1.1 [硬件参数](#11-硬件参数)
   - 1.2 [准备工作](#12-准备工作)
   - 1.3 [Autoware 部署 AWSIM 联合仿真](#13-autoware-awsim-simulation)
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


## 1.3 Autoware AWSIM Simulation
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

# 2. 实车部署
## 2.1 实车建图

在建图过程中，我们选择了 `Lego-LOAM`、`ndt_map` 和 `Cartographer` 三种建图方式。每种方式都有其特点和适用场景，以下对各方法进行了详细说明：

---

- 1. Lego-LOAM

Lego-LOAM（Lightweight and Ground-Optimized LiDAR Odometry and Mapping）是一种轻量级且对地面优化的激光雷达建图方式。它的核心在于利用六自由度（6DoF）的姿态估计来实时生成车辆周围的点云地图。Lego-LOAM 使用的是**左手坐标系**，不太适合 Autoware 这样的应用环境，但对于非 Autoware 的应用仍然是一个高效的选择。

- **应用场景**：适合静态或平坦的环境，在地面导航、工业仓储等场景中表现良好。

- **安装与配置**：
  - Lego-LOAM 的安装代码：
    ```bash
    # 克隆仓库
    git clone https://github.com/RobustFieldAutonomyLab/LeGO-LOAM.git
    cd LeGO-LOAM

    # 编译项目
    mkdir build && cd build
    cmake ..
    make
    ```
  - 参考文档：[LeGO-LOAM GitHub 仓库](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM)

---

- 2. NDT_MAP

NDT_MAP 是一种基于正态分布变换（NDT, Normal Distributions Transform）的建图方式，尤其适合在动态变化的复杂环境中使用。它结合了 `ndt_mapping` 和 `Lego-LOAM` 的回环检测技术，生成细致且动态更新的环境模型。NDT_MAP 使用**右手坐标系**，适配 Autoware 等应用环境，在复杂、动态的场景中表现出色。

- **应用场景**：适合复杂、动态环境中的机器人导航应用，如城市交通、自动驾驶等。

- **安装与配置**：
  - NDT_MAP 的安装代码：
    ```bash
    # 克隆仓库
    git clone https://github.com/jyakaranda/ndt_map.git
    cd ndt_map

    # 编译项目
    mkdir build && cd build
    cmake ..
    make
    ```
  - 参考文档：[ndt_map GitHub 仓库](https://github.com/jyakaranda/ndt_map)

---

- 3. Cartographer

Cartographer 是由 Google 开发的一个实时建图和定位框架，广泛应用于 2D 和 3D 的 SLAM 任务中。它能够通过激光雷达和 IMU 数据实现高效建图和定位，支持**右手坐标系**，因此可以与 Autoware 等平台很好地集成。

- **应用场景**：适合室内外环境的实时定位与建图应用，如物流、自动驾驶、巡检机器人等。

- **安装与配置**：
  - Cartographer 的安装代码：
    ```bash
    # 安装依赖
    sudo apt-get update
    sudo apt-get install -y python3-wstool python3-rosdep ninja-build

    # 克隆仓库
    mkdir -p ~/cartographer_ws/src
    cd ~/cartographer_ws
    wstool init src
    wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
    wstool update -t src

    # 安装 ROS 依赖
    rosdep update
    rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

    # 编译
    catkin_make_isolated --install --use-ninja
    ```
  - 参考文档：[Cartographer GitHub 仓库](https://github.com/cartographer-project/cartographer)

---

### 建图方式选择建议

- **如果需要实时性和较高精度的建图**：推荐使用 Cartographer，其速度和精度在实际应用中表现良好。
- **如果环境较为平坦，且对实时性要求高**：可以选择 Lego-LOAM，特别适合地面应用。
- **如果环境复杂、动态变化较大**：建议使用 NDT_MAP，其回环检测和更新能力适合复杂环境。

## 2.2 实车定位
## 2.3 实车导航

