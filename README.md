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
### 对比（请按照适配场景选择所需建图工具）

| 特性           | **Lego-LOAM**                                                                                                                                                  | **NDT_MAP**                                                                                                                                                                | **Cartographer**                                                                                                                                                               |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **适用坐标系** | 左手坐标系，不适用于所有系统                                                                                                                                     | 右手坐标系，适配 Autoware 等系统                                                                                                                                            | 右手坐标系，与 Autoware 等平台良好集成                                                                                                                                           |
| **实时性**     | 高，适合实时建图                                                                                                                                               | 中等，计算量较大                                                                                                                                                           | 高，计算速度快，适用于实时应用                                                                                                                                                  |
| **精度**       | 高精度建图，适合静态或平坦环境                                                                                                                                  | 高精度定位，适合复杂动态环境                                                                                                                                               | 高精度建图，提供回环检测与闭环校正                                                                                                                                            |
| **回环检测**   | 不支持回环检测，主要用于短时定位                                                                                                                                 | 支持回环检测，可动态更新环境模型                                                                                                                                            | 支持回环检测与闭环校正，生成准确地图                                                                                                                                            |
| **环境适用性** | 静态、平坦环境，地面优化效果良好                                                                                                                               | 复杂、动态环境，适合自动驾驶和城市交通                                                                                                                                    | 室内外环境，适合物流、自动驾驶和巡检等场景                                                                                                                                      |
| **硬件需求**   | 硬件需求较低，适合一般计算设备                                                                                                                                  | 硬件需求较高，适合配备 GPU 的计算环境                                                                                                                                       | 内存消耗大，对传感器配置要求高                                                                                                                                                  |
| **安装配置**   | 简单，依赖较少                                                                                                                                                 | 中等，需要配置 Autoware 环境                                                                                                                                                | 配置复杂，需要多个传感器的支持                                                                                                                                                  |

---
##Lego-LOAM

Lego-LOAM（Lightweight and Ground-Optimized LiDAR Odometry and Mapping）是一种轻量级的激光雷达建图方式，专为地面车辆设计，能够实时生成车辆周围的高精度点云地图。它的核心是通过**六自由度（6DoF）姿态估计**进行实时定位和建图，利用激光雷达测距数据在静态或平坦环境中进行建图，适合小规模场景的高效建图和里程计应用。Lego-LOAM 使用**左手坐标系**，因此不适合右手坐标系需求的 Autoware 环境，但在其他系统中有广泛的应用价值。

- **核心算法**：
  - **LOAM（LiDAR Odometry and Mapping）**：Lego-LOAM 基于 LOAM 框架，将激光雷达的里程计与建图功能分离，确保里程计实时运行并以一定频率构建地图。其分割过程包括特征提取、点云配准和地图更新。
  - **特征点提取**：通过计算激光雷达点云的曲率，Lego-LOAM 提取出角点和平面点，减少计算量的同时提高定位精度。
  - **ICP（Iterative Closest Point）**：Lego-LOAM 采用 ICP 算法将连续扫描的数据进行匹配，实现高效、精确的点云配准。


- **安装与配置**：
  - Lego-LOAM 需要在 ROS1 Noetic 版本下运行，并依赖 Eigen 和 PCL 等库。请确认安装 ROS Noetic 版本，并确保安装了 Eigen、PCL 和其他必要的依赖项。
  - Lego-LOAM 的安装步骤如下：
    ```bash
    # 克隆仓库
    git clone https://github.com/RobustFieldAutonomyLab/LeGO-LOAM.git
    cd LeGO-LOAM

    # 设置工作空间并安装必要的依赖项
    rosdep install --from-paths src --ignore-src -r -y

    # 编译项目
    mkdir build && cd build
    cmake ..
    make
    ```
  - 参考文档：[LeGO-LOAM GitHub 仓库](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM)


---
##NDT_MAP

NDT_MAP 是一种基于正态分布变换（NDT, Normal Distributions Transform）的激光雷达建图方法，特别适合动态变化的复杂环境。NDT_MAP 将**ndt_mapping**技术与**回环检测**结合，实现高精度的环境建模和实时更新。NDT_MAP 使用**右手坐标系**，因此与 Autoware 等右手坐标系的应用平台兼容性极佳，尤其在复杂、动态的场景中表现优异。

- **核心算法**：
  - **Normal Distributions Transform（NDT）**：NDT 利用正态分布来表示激光雷达点云中的特征区域，将空间划分成多个栅格，并为每个栅格建立正态分布模型，从而对环境特征进行建模。通过在模型中匹配新的点云数据，可以高效实现定位和建图。
  - **回环检测**：NDT_MAP 结合回环检测技术，能够在已建图的区域中识别重复路径，从而实现地图的闭环校正和更新，提升建图的精确性和连续性。


- **安装与配置**：
  - NDT_MAP 需要在 ROS 环境下运行，建议在 ROS1 Noetic 版本中使用。安装前确保已配置 Eigen 和 PCL 等必备依赖库。
  - NDT_MAP 的安装步骤如下：
    ```bash
    # 克隆仓库
    git clone https://github.com/jyakaranda/ndt_map.git
    cd ndt_map

    # 安装所需依赖项
    rosdep install --from-paths src --ignore-src -r -y

    # 编译项目
    mkdir build && cd build
    cmake ..
    make
    ```
  - 参考文档：[ndt_map GitHub 仓库](https://github.com/jyakaranda/ndt_map)

---
##Cartographer(我们团队选择的工具)

Cartographer 是 Google 开发的一款实时建图与定位框架，支持**2D** 和 **3D** 的 SLAM 应用，适用于多种场景。该系统结合了激光雷达和 IMU 数据，能够高效地完成建图和定位任务。Cartographer 支持**右手坐标系**，与 Autoware 等主流右手坐标系平台具有良好的兼容性。其模块化设计使其能够处理室内外环境中的复杂建图和定位需求。

- **核心算法**：
  - **Graph SLAM（图优化 SLAM）**：Cartographer 采用图优化的 SLAM 算法，将环境中多个传感器数据构建成图结构，通过前端的里程计估计和后端的图优化来提升定位和建图精度。
  - **回环检测和闭环校正**：在地图的回环检测中，Cartographer 自动检测路径闭环并进行调整，从而修正定位误差并优化地图结构，以提高长时间建图的精确性。
  - **扫描匹配**：通过激光雷达数据的扫描匹配技术，Cartographer 能够在动态环境下实现高效的定位与建图，适应性强。


- **安装与配置**：
  - Cartographer 需要在 ROS 环境下运行，建议使用 ROS1 Noetic 版本，安装前需确保配置了 Eigen、PCL、Cerres 等必要的依赖项。
  - Cartographer 的安装步骤如下：
    ```bash
    # 安装基础依赖
    sudo apt-get update
    sudo apt-get install -y python3-wstool python3-rosdep ninja-build

    # 克隆仓库并初始化工作空间
    mkdir -p ~/cartographer_ws/src
    cd ~/cartographer_ws
    wstool init src
    wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
    wstool update -t src

    # 安装 ROS 依赖项
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

