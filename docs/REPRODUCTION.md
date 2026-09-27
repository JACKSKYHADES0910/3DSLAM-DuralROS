# 复现教程与历史环境

[返回项目首页](../README.md) · [实现依据](EVIDENCE.md) · [原 README](archive/README.original.md)

本教程重新组织原 README 的系统准备、AWSIM 仿真、三类建图方法、定位与导航内容，并用仓库中的真实文件修正示例。以下 ROS 命令面向 **Linux/Ubuntu**；2026 年文档核查验证了文件与参数对应关系，尚未在 Ubuntu 或实车上重新编译、运行。

**建议顺序：环境 → 依赖完整性 → 传感器/TF → 建图 → 保存地图 → 定位 → 导航。** AWSIM 与 ROS2 使用独立环境，避免混用不同时期的安装步骤。

<a id="environment"></a>
## 1. 历史环境和硬件资料

当时记录的组合是 Ubuntu 20.04、ROS1 Noetic 和 ROS2 Galactic，主机为 HP OMEN、i7-10750H。原文 GPU 名称 `RTX-2070Ti` 尚待原机核实；不以这个型号推导 CUDA、显存或 TensorRT 兼容性。

Noetic 已于 **2025-05-31** 结束官方支持，Galactic 的支持期已于 **2022-11** 结束。这里保留旧环境用于理解和复原历史项目；新开发环境应根据驱动与依赖选择 ROS2 的受支持版本。[ROS1 官方说明](https://www.ros.org/blog/noetic-eol/) · [ROS2 发布周期](https://github.com/ros2/ros2_documentation/blob/rolling/source/Releases.rst)

| 资料 | 用途 |
| :-- | :-- |
| [AutoLabor M1 手册](http://www.autolabor.com.cn/usedoc/m1/navigationKit/receivingGuide/inspection) | 底盘检查、接线与操作 |
| [AutoLabor 下载](http://www.autolabor.com.cn/download) | 与系统对应的底盘软件 |
| [RS-LiDAR 历史驱动](https://gitee.com/xiaoxinslam/ros_rslidar) | 原 README 提供的驱动入口 |
| [RoboSense rslidar_sdk](https://github.com/RoboSense-LiDAR/rslidar_sdk) | 上游驱动与传感器配置 |
| [HIPNUC 产品仓库](https://github.com/hipnuc/products/tree/master) | CH104M 等惯导资料 |
| [Kinect for Windows](https://learn.microsoft.com/en-us/windows/apps/design/devices/kinect-for-windows) | 原相机参考；Ubuntu 驱动结合仓库 `iai_kinect2-master` 阅读 |
| [HP OMEN](https://www.omen.com/cn/zh/laptops.html) | 原文主机产品入口 |

### 系统分区与厂商软件

原作者使用 Windows 10 + Ubuntu 20.04 双系统，参考 [HP OMEN 双系统安装笔记](https://blog.csdn.net/Robert_Q/article/details/115842915)。原分区为 `/` 250 GB、`/boot` 10 GB、swap 32 GB、EFI 1 GB、`/home` 剩余约 707 GB。这是原机记录，不是最小磁盘要求。

旧驱动可能缺失或需手动适配。原文提出从官方获得 Ubuntu 20.04/Noetic 软件，或在另一台机器安装厂商镜像后备份 `catkin_ws`，再迁移到运行主机并适配 `cmd_vel`。

原下载条目标为 **“AutolaborOS-24.04-amd64.iso (Ubuntu18.04 ROS Melodic)”**，文件名与括号内版本有歧义。保留[原下载入口](http://www.autolabor.com.cn/download?hmsr=gwstastics&hmpl=os&hmcu=24.04)，以镜像发行说明为准；不要把 Melodic 构建产物直接当作 Noetic 编译结果。

原文推荐[鱼香 ROS 安装说明](https://fishros.org.cn/forum/topic/20/%E5%B0%8F%E9%B1%BC%E7%9A%84%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E7%B3%BB%E5%88%97)与 [fishros/install](https://github.com/fishros/install)。原命令 `wget http://fishros.com/install -O fishros && . fishros` 保留于归档。使用前按上游说明获取、查看脚本，并确认所选系统与 ROS 版本。

<a id="preflight"></a>
## 2. 复现前检查

当前仓库是实验工作空间快照，以下问题可在源码与 Git 树中定位：

| 检查点 | 当前记录 | 处理方向 |
| :-- | :-- | :-- |
| 子仓库 | 有 8 个 gitlink，根目录缺少 `.gitmodules` | 补齐下载地址与对应提交；仅 `--recursive` 不能恢复缺失映射 |
| LiDAR 驱动 | `src/driver/lidar/rslidar_sdk` 是 gitlink | 恢复原驱动版本，确认 RS16 配置与 `/rslidar_points` |
| LiDAR 配置 | 活动节点的 `config_path` 为空 | 指向本机真实 YAML |
| 底盘串口 | `/dev/ttyUSB_custom0 ` 有尾随空格 | 改为真实设备路径，检查 udev 与权限 |
| 雷达型号 | `lidar3d` 写作 `rs16 ` | 核对 xacro 条件与型号，处理尾随空格 |
| IMU | `/dev/ttyUSB_custom1` | 核对设备、波特率、安装方向与话题 |
| 地图 | 默认 `campus.pbstream` 与 `campus.yaml` | 使用同一次建图生成的配套文件 |
| 构建产物 | 包含原机 build/devel/install 目录 | 在新的工作空间编译 |
| YOLO / ROS2 | 缺少完整检测适配节点和 ROS2 工作空间 | 作为独立集成工作补齐 |

定位文件：[底层启动](../src/launch/autolabor_navigation_launch/launch/real_environment/third_generation_base.launch) · [导航入口](../src/launch/autolabor_navigation_launch/launch/real_environment/third_generation_navigation_3d.launch)。本次文档更新标明这些问题，没有改动实车源码。

<a id="build"></a>
## 3. 工作空间与编译

下面是**依赖补齐后的参考顺序**，不是已验证的一键安装器。另建工作空间，避免旧缓存和原机绝对路径干扰。

```bash
# Ubuntu 20.04 + 已安装的 ROS Noetic
source /opt/ros/noetic/setup.bash
sudo apt update
sudo apt install python3-rosdep ninja-build

# 仅在 rosdep 尚未初始化时执行 sudo rosdep init
rosdep update

# 将占位路径替换为真实克隆目录，目标应是新的工作空间
mkdir -p ~/3dslam_ws/src
cp -a /path/to/3DSLAM-DuralROS/src/. ~/3dslam_ws/src/
cd ~/3dslam_ws

# 此前需恢复上节指出的 gitlink 依赖
rosdep install --from-paths src --ignore-src --rosdistro noetic -r -y
catkin_make_isolated --use-ninja
source devel_isolated/setup.bash
```

如果依赖安装或编译失败，先处理对应包，避免继续加载不完整的工作空间。这里使用 `devel_isolated`：仓库中的主 launch 包及部分驱动/工具缺少完整安装规则，单独加载 `install_isolated` 会遗漏必要的启动文件、参数或节点。

原文列出 Eigen、PCL、Ceres 等 SLAM 依赖。以下保留独立学习上游 Cartographer 的历史流程；复原本项目应优先使用仓库中保留的修改版本：

```bash
sudo apt-get install -y python3-wstool python3-rosdep ninja-build
mkdir -p ~/cartographer_ws/src
cd ~/cartographer_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall
wstool update -t src
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro="${ROS_DISTRO}" -y
catkin_make_isolated --install --use-ninja
```

本项目 occupancy grid 节点有 `unknow_as_free` 扩展，不能假定任意上游版本都兼容这些启动参数。[源码](../src/mapping/cartographer_ros/cartographer_ros/cartographer_ros/occupancy_grid_node_main.cc)

<a id="sensors"></a>
## 4. 传感器、时间和 TF

完成配置检查后，先启动底层硬件。建图/导航入口也会包含该文件，避免重复启动同名节点。

```bash
roslaunch autolabor_navigation_launch third_generation_base.launch

# 在另一个已 source 同一工作空间的终端检查
rostopic list
rostopic hz /rslidar_points
rostopic hz /odom
rostopic echo -n 1 /odom
rosrun tf tf_echo base_link imu_link
```

点云应有正确 `frame_id` 与递增时间戳。IMU 话题名以驱动输出为准，检查角速度、线加速度、姿态和单位；里程计方向应与实际运动一致。配置使用 `map`、`odom`、`base_link`、`imu_link`，TF 树应连续，并避免重复发布同一变换。

第三代建图配置为 `use_odometry = true`、`num_point_clouds = 1`、`num_laser_scans = 0`、`tracking_frame = "imu_link"`，启用 3D trajectory builder；`points2` 重映射到 `rslidar_points`。原文 2D `velodyne_scan` 示例不对应这条输入链路。

Kinect 用于 RGB/深度和视觉检测实验。材料中的 Visual SLAM、VINS-Mono 与融合 SLAM 是背景知识，不代表当前 Cartographer 已融合相机观测。

<a id="mapping"></a>
## 5. 实车建图与地图保存

底层数据正常后，停止单独运行的底层 launch，启动包含驱动的建图入口：

```bash
roslaunch autolabor_navigation_launch third_generation_cartographer_3d.launch
```

确认 RViz 中点云、TF、轨迹与栅格随运动变化。使用经过校准的底盘控制稳定采集，回到已访问区域观察闭环约束与地图一致性。地图精度还需要场地测量与记录支撑，不能仅凭视觉判断。

`.pbstream` 保存 Cartographer 状态；`.pgm + .yaml` 提供导航使用的栅格地图。

```bash
# 确认活动轨迹 ID
rosservice call /get_trajectory_states "{}"

# 0 仅为示例，替换为上一步返回的活动轨迹 ID
rosservice call /finish_trajectory "{trajectory_id: 0}"

# 路径位于 cartographer_node 所在主机，目录需要预先存在
rosservice call /write_state "{filename: '/absolute/path/campus.pbstream', include_unfinished_submaps: true}"
rosrun map_server map_saver -f /absolute/path/campus
```

检查服务返回状态、文件大小、YAML 的 `image` 路径、分辨率与原点。导航时加载这组配套文件。仓库中的校园地图可以用来观察格式，新的物理场地需要自己的地图。

### 其他建图方案

原文还介绍 [LeGO-LOAM](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM) 和 [ndt_map](https://github.com/jyakaranda/ndt_map)。LeGO-LOAM 用地面分割、边缘/平面特征降低计算量，上游包含基础 ICP 回环；NDT 用栅格统计分布完成点云配准，回环能力取决于具体系统。

原 `rosdep` 与 `cmake/make` 安装片段保留于[归档](archive/README.original.md)。LeGO-LOAM 上游使用 catkin 工作空间且有额外依赖，原文单独 `cmake ..` 不能作为通用步骤。按所选版本上游 README 安装，并适配 RS16 点云格式、线束与外参。`ndt_map` 历史链接不等于已锁定的 Autoware `ndt_mapping` 实验版本，需另行核实。

<a id="localization"></a>
## 6. 地图加载与初始定位

仓库实际使用命令行 flag 加载状态：

```xml
<node name="cartographer_node" pkg="cartographer_ros"
      type="cartographer_node"
      args="-configuration_directory $(find autolabor_navigation_launch)/params/cartographer
            -configuration_basename third_generation_location.lua
            -load_state_filename $(find autolabor_navigation_launch)/map/campus.pbstream"
      output="screen">
  <remap from="points2" to="rslidar_points" />
</node>
```

`third_generation_location.lua` 继承 3D 配置，启用 `pure_localization_trimmer`，保留 3 个活动子地图，设置 `publish_frame_projected_to_2d = true`。它在保存地图上持续匹配，为地面导航提供位姿。

在 RViz 用 **2D Pose Estimate** 给出当前位置与朝向。`cartographer_initialpose` 接收 `/initialpose`，结束当前活动轨迹，再请求 `/start_trajectory`，设置 `use_initial_pose` 和相对轨迹。这个流程不等于运行 AMCL 粒子滤波器。

原文 `initial_pose_x/y/a`、`<param name="load_state_filename">`、`TRAJECTORY_BUILDER.pure_localization = true` 与 2D 参数示例均保留在历史文件；它们不能直接替代上述 3D 配置。

原文讨论的 `huber_scale`、`optimize_every_n_nodes`、`constraint_builder.min_score` 与 `global_localization_min_score`，分别影响鲁棒优化、优化频率和约束接受门限。应使用相同记录逐项比较，而不把参数视为“自动消除动态物体”的保证。场地显著变化后应更新或重建地图。

<a id="navigation"></a>
## 7. 导航与局部避障

地图、驱动与传感器配置完成后：

```bash
roslaunch autolabor_navigation_launch third_generation_navigation_3d.launch
```

该入口启动底层驱动、Cartographer 定位、map_server、initialpose 工具、move_base 与 RViz，不要同时运行建图 launch。先初始化并观察定位，再用 **2D Nav Goal** 设定目标。实车试验在可控场地进行，确认急停与人工接管可用。

1. `global_planner/GlobalPlanner` 生成全局路径，当前 `use_dijkstra: true`。PPT 的 A* 属于算法讲解，切换需要单独评估。
2. `teb_local_planner/TebLocalPlannerROS` 优化带时间信息的局部轨迹，综合运动学、速度与障碍约束。配置中的 `max_vel_x: 0.2` 是规划器速度上限，不是底盘最大速度或实测平均速度。
3. 局部 costmap 的体素层使用 `rslidar_points` 的 `PointCloud2` 观测标记/清除障碍；当前全局 costmap 只启用静态地图与膨胀层。footprint 与膨胀范围应按实际车体配置。
4. `/cmd_vel` 交给底盘驱动；检查方向、限速、串口与里程计反馈。

### YOLOv5 与规划器之间还需要什么

论文和视频展示 YOLOv5 检测及其与 TEB 配合的设计。YOLOv5 输出类别、置信度和二维框；规划器还需要深度/点云关联、坐标变换、跟踪或障碍消息适配。检测到一个“人”并不自动得到其三维位置与速度。

当前公开仓库未找到完整适配链路和权重。可直接核实的是 **LiDAR → costmap → TEB**。原文有关 YOLOv5 单次前馈、实时识别、动态避障的内容保留于归档；复现时应分别验证检测与规划输入。

<a id="awsim"></a>
## 8. Autoware 与 AWSIM 联合仿真

原文记录 [Autoware.AI](https://github.com/autowarefoundation/autoware_ai)、[Autoware.universe](https://github.com/autowarefoundation/autoware.universe) 及 [Universe 安装笔记](https://blog.csdn.net/zardforever123/article/details/132528899)。GPU 驱动、CUDA、TensorRT、cuDNN 与 ROS 应匹配所选上游版本；Autoware 不是本仓库 ROS1 导航的前置依赖。

该 CSDN 历史笔记在本次链接检查中被网站拦截，未能验证正文；入口予以保留，安装以对应版本的官方文档为准。

以下为 **AWSIM v1.0.1 历史流程**，参考[对应官方文档](https://github.com/tier4/AWSIM/blob/v1.0.1/docs/GettingStarted/QuickStartDemo/index.md)，不适用于任意当前 Autoware 版本。

### DDS 与依赖

原文设置环境的位置应为 `~/.bashrc`。建议先在专用终端验证，再决定是否持久化：

```bash
export ROS_LOCALHOST_ONLY=1
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

if [ ! -e /tmp/cycloneDDS_configured ]; then
    sudo sysctl -w net.core.rmem_max=2147483647
    sudo ip link set lo multicast on
    touch /tmp/cycloneDDS_configured
fi

sudo apt update
sudo apt install libvulkan1 unzip
```

`ROS_LOCALHOST_ONLY=1` 对应同机仿真场景，多机通信不要照搬。

### 程序与地图

下载 [AWSIM_v1.0.1.zip](https://github.com/tier4/AWSIM/releases/download/v1.0.1/AWSIM_v1.0.1.zip) 与 [nishishinjuku_autoware_map.zip](https://github.com/tier4/AWSIM/releases/download/v1.0.0/nishishinjuku_autoware_map.zip)。地图地址中的 v1.0.0 是原教程的组合。

```bash
cd ~/Downloads
unzip AWSIM_v1.0.1.zip
unzip nishishinjuku_autoware_map.zip

# 替换为解压后的模拟器目录
cd /path/to/AWSIM
chmod +x AWSIM.x86_64
./AWSIM.x86_64
```

原文将地图置于启动文件旁，关键是 `map_path` 指向真实地图目录。保留[原权限截图](https://github.com/tier4/AWSIM/raw/v1.0.1/docs/GettingStarted/QuickStartDemo/Image_1.png)与[联合仿真截图](https://github.com/tier4/AWSIM/raw/v1.0.1/docs/GettingStarted/QuickStartDemo/Image_Initial.png)。

### 配套 Autoware

在另一个设置相同 DDS 环境的终端中运行历史命令：

```bash
cd ~/autoware_universe
source install/setup.bash
ros2 topic list
ros2 launch autoware_launch e2e_simulator.launch.xml \
  vehicle_model:=sample_vehicle \
  sensor_model:=awsim_sensor_kit \
  map_path:=/absolute/path/to/nishishinjuku_autoware_map
```

检查传感器、定位、路线、控制反馈与模拟车辆响应，不能仅以窗口打开作为成功。新环境请从 [Autoware 官方文档](https://autowarefoundation.github.io/autoware-documentation/main/)选择配套版本。

<a id="bridge"></a>
## 9. ROS1/ROS2 桥接

PPT 第 49 页与论文记录 `ros1_bridge`。桥接前要核对消息类型、字段、坐标、时间戳和 QoS，自定义消息还需要两侧类型支持。消息互通不代表已经适配 Autoware 的车辆控制接口。

上游要求在 ROS1/ROS2 都可安装构建的环境中运行桥接，Ubuntu 24.04 不原生支持这条 ROS1 路径。[官方兼容说明](https://github.com/ros2/ros1_bridge#supported-ros-and-ubuntu-versions)

本仓库没有桥接版本锁定和完整构建配置，该部分作为独立集成记录阅读。[迁移建议](ROADMAP.md)

<a id="troubleshooting"></a>
## 10. 排查与工程经验

| 现象 | 优先检查 |
| :-- | :-- |
| 无点云 | 雷达地址/端口、驱动、`config_path`、话题名、网卡 |
| TF 失败 | frame 名称、xacro、安装外参、时间戳、重复发布 |
| 地图弯曲或位姿跳变 | IMU 数据、里程计标定、同步、轮滑、反射 |
| 地图加载后位置错误 | 状态与栅格是否配套、初始姿态、外参 |
| 有全局路径但不走 | 局部轨迹、障碍代价、速度输出、串口、限速与急停 |
| YOLO 有框但避障无变化 | 深度、坐标变换、障碍消息适配、规划器订阅 |
| 移动供电时卡顿 | 电源能力、CPU 频率、温度、散热、丢帧 |
| ROS2 有话题但不可用 | 消息语义、时间、QoS、外参与车辆接口 |

原论文提出用多帧聚合、深度补全、更高线数/更多 LiDAR、其他传感器和动态滤波处理反射问题。这些是候选方案，未逐项验证；包含“未来 5 帧”的聚合会增加等待延迟，不能当作无延迟在线算法。

下一次复现至少记录环境版本、Git 提交、传感器标定、场地、bag、配置、日志与成功/失败判据，以便客观比较改进。
