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

---

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

---

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
---

# 2. 实车部署
## 2.1 实车建图

在建图过程中，我们选择了 `Lego-LOAM`、`ndt_map` 和 `Cartographer` 三种建图方式。每种方式都有其特点和适用场景，以下对各方法进行了详细说明：


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

## Lego-LOAM

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


## NDT_MAP

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

## Cartographer(我们团队选择的工具)

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


### 建图方式选择建议

- **如果需要实时性和较高精度的建图**：推荐使用 Cartographer，其速度和精度在实际应用中表现良好。
- **如果环境较为平坦，且对实时性要求高**：可以选择 Lego-LOAM，特别适合地面应用。
- **如果环境复杂、动态变化较大**：建议使用 NDT_MAP，其回环检测和更新能力适合复杂环境。

---

## 2.2 实车定位

定位部分采用**手动标定与自动匹配相结合**的策略，以确保初始定位精确并实现后续的自动定位。主要定位算法基于 Cartographer，通过其独特的扫描匹配和图优化机制来实现高精度定位。具体流程如下：

## 2.2 实车定位

实车定位采用**手动标定与自动匹配相结合**的策略，以确保初始定位的精确性并在后续实现持续的自动定位。Cartographer 是核心定位算法，其通过独特的扫描匹配和图优化机制，实现高精度的实时定位。具体流程如下：

### 1. 首次手动标定
   - 在首次启动时，操作人员需要进行手动标定，以确保机器人准确识别其初始位置。
   - 在建好的地图上选择起始位置，并将其与实际环境对齐，包括：
     - **初始姿态调整**：确保机器人朝向与地图方向一致，减少算法的初始误差。
     - **传感器数据同步**：启用 LiDAR、IMU 等传感器，确保各传感器的数据与初始位置同步。
   - 手动标定后，系统将该位置和姿态作为起始参考点，供 Cartographer 定位算法使用。

   ```xml
   <!-- cartographer_node 启动文件的示例配置 -->
   <node name="cartographer_node" pkg="cartographer_ros" type="cartographer_node" output="screen">
       <param name="use_sim_time" value="false"/>
       <param name="initial_pose_x" value="0.0"/>
       <param name="initial_pose_y" value="0.0"/>
       <param name="initial_pose_a" value="0.0"/>
       <remap from="scan" to="velodyne_scan"/>
   </node>
   ```
   - 上述配置文件示例用于设定 Cartographer 节点的初始位置和姿态角度（`initial_pose_x`, `initial_pose_y`, `initial_pose_a`），以便进行精确的初始标定。

### 2. 自动匹配定位（基于 Cartographer）
   - 手动标定完成后，系统启用 Cartographer 的自动定位算法，根据实时传感器数据与地图匹配，实现持续自动定位。
   - **Cartographer 定位算法的关键技术**：
     - **前端扫描匹配**：Cartographer 使用激光雷达的点云数据与现有地图进行实时扫描匹配，通过**匹配精细的点云数据**来估计机器人的相对位移。前端会在局部地图中持续校正机器人位置，确保高实时性。
     - **IMU 融合**：Cartographer 会使用 IMU 数据来改进姿态估计，尤其在点云不足的区域（如长直走廊）中，IMU 能提供更稳定的姿态信息，减少位姿误差的积累。
     - **回环检测和闭环校正**：当机器人识别到已访问过的区域时，Cartographer 的回环检测模块会触发闭环校正，将当前位置与之前的位置对齐，从而消除累积误差。这一特性确保地图长期稳定，特别适合大范围巡航。
     - **自动纠偏**：Cartographer 不断在前端扫描匹配和后端图优化之间交替工作，以确保机器人在长时间运行中的定位精度和稳定性。
     ```xml
     #trajectory_builder 配置文件示例
         TRAJECTORY_BUILDER.pure_localization = true
         TRAJECTORY_BUILDER_2D.min_range = 0.3
         TRAJECTORY_BUILDER_2D.max_range = 30.0
         TRAJECTORY_BUILDER_2D.use_imu_data = true
         TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
         TRAJECTORY_BUILDER_2D.submaps.num_range_data = 35
         MAP_BUILDER.use_trajectory_builder_2d = true
     ```
     - 以上配置文件示例中，将 `TRAJECTORY_BUILDER.pure_localization` 设置为 `true` 以启用纯定位模式，并对激光雷达的最小和最大范围、IMU 数据、在线相关扫描匹配等参数进行了调整，适用于自动匹配定位。


### 3. 动态环境下的定位优化
   - Cartographer 的自动匹配系统能够根据实时传感器数据和先验地图进行动态调整。针对复杂和动态变化的环境，Cartographer 会通过其扫描匹配机制不断更新机器人位置。
   - 在动态环境中，Cartographer 利用 NDT 和 ICP 算法适应环境变化，确保机器人在有障碍物或移动物体的场景中定位稳定。
   ```xml
   #动态环境的优化配置示例
      POSE_GRAPH.optimization_problem.huber_scale = 1e1
      POSE_GRAPH.optimize_every_n_nodes = 90
      POSE_GRAPH.constraint_builder.min_score = 0.55
      POSE_GRAPH.constraint_builder.global_localization_min_score = 0.6
   ```
   - 上述配置文件示例中设置了 `POSE_GRAPH.optimization_problem.huber_scale` 和 `POSE_GRAPH.constraint_builder.min_score` 等参数，以应对动态环境下的定位优化需求，提高对动态物体的适应性。


### 4. 定位精度与误差管理
   - 系统会持续监测定位精度，并根据实时环境和传感器反馈自适应调整参数，减小误差。
   - Cartographer 的闭环检测和多传感器融合机制能够在长时间运行后自动校准累积误差，确保长期定位的稳定性。通过后端的图优化，Cartographer 将多个扫描结果整合到全局地图中，以进一步降低漂移。
   ```xml
   #调用 Cartographer ROS 服务完成路径优化
   rosservice call /finish_trajectory 0
   rosservice call /write_state "{filename: '/path/to/map.bag.pbstream'}"
   ```
   - 保存的 `.pbstream` 文件可以在后续启动 Cartographer 时加载，以快速恢复先前的地图状态，适用于重复性任务或多次启动需求的应用场景。

  ```xml
  <!-- 恢复 .pbstream 地图文件的 Cartographer 启动文件示例 -->
  <node name="cartographer_node" pkg="cartographer_ros" type="cartographer_node" output="screen">
      <param name="use_sim_time" value="false"/>
      <param name="load_state_filename" value="/path/to/map.bag.pbstream"/>
      <remap from="scan" to="velodyne_scan"/>
  </node>
  ```
   - 上述启动文件示例中，通过设置 `load_state_filename` 参数，将 `.pbstream` 文件加载到 Cartographer 中，实现地图和定位状态的恢复。这样，机器人可以直接基于已有地图进行定位，而无需重新进行完整的地图构建。

   - 注意事项：

      - 文件路径：确保 `.pbstream` 文件的路径正确且可访问，否则 Cartographer 将无法加载地图。
      - 坐标对齐：在加载保存的地图状态时，请确保机器人实际位置与地图中的初始位置一致，以减少误差。
      - 地图更新：如果环境发生显著变化，建议重新构建或更新地图，以确保定位准确性。
   - 总结：通过 Cartographer 的 `.pbstream` 文件保存和恢复功能，用户可以在多次启动或重复任务中快速恢复地图状态，减少重复构图的时间消耗。同时，通过回环检测和图优化，Cartographer 提供了稳定可靠的定位效果，适应动态环境的变化。



## 2.3 实车导航
# 机器人导航系统概述

使用`nav goal`指定目标地点后，`global_planner`会进行全局规划以确定机器人从当前位置到目标位置的最佳路径。随后，`cost_map`模块会基于静态环境数据进行障碍物避让，确保路径不会穿越固定障碍物。而在动态避障方面，系统结合了`YOLOv5`和`teb_local_planner`的功能。`YOLOv5`负责实时识别机器人周围的动态物体，例如椅子或人等，并将这些识别信息传递给`teb_local_planner`。`teb_local_planner`则根据这些动态物体的位置和移动轨迹，动态调整路径，以确保机器人能够顺利避开障碍物，安全到达目的地。

## YOLOv5介绍
`YOLOv5`（You Only Look Once version 5）是一种实时物体检测算法，它采用单次前馈神经网络结构来识别图像中的目标。相比于其他检测算法，`YOLOv5`在速度和准确率上都具有较好的平衡，特别适合对延迟要求较高的应用场景。通过训练，`YOLOv5`可以识别多种物体类别，比如人、椅子、车等。在本系统中，`YOLOv5`的主要功能是实时检测机器人周围的动态障碍物，并向`teb_local_planner`提供其位置信息，以便进行实时避障和路径调整。

## 导航模块（move_base）
`move_base`是一个ROS包，用于结合路径规划和障碍物避免，来帮助机器人实现自主导航。在图中，`move_base`模块整合了多个规划模块，包括`global_planner`（全局规划）和`teb_local_planner`（局部规划）模块。`move_base`接收来自传感器（如激光雷达、编码器等）获取的周围环境信息，并根据这些信息进行导航和避障。

## 全局规划（global_planner，使用Dijkstra算法）
`global_planner`模块负责计算机器人从当前位姿到目标位姿的全局路径，使用了Dijkstra算法。Dijkstra算法是一种经典的图搜索算法，可以在已知地图上找到从起始点到目标点的最短路径。`global_planner`会根据地图数据和目标位置生成一个理想路径，这个路径会被传递给后续的局部规划模块。

## 局部规划（teb_local_planner）
`teb_local_planner`模块是一个基于时间弹性带（Time Elastic Band, TEB）的局部路径规划器，专门用于处理机器人避障和动态环境下的路径调整。`teb_local_planner`结合了来自`YOLOv5`的识别结果，根据实时的障碍物信息（如前后雷达数据及YOLO识别到的动态物体），在全局路径的基础上进行微调，以确保机器人可以平稳、安全地避开障碍物，跟随最优路径前进。

