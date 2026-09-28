# 项目证据、素材来源与技术说明

[项目首页](../README.md) · [复现教程](REPRODUCTION.md) · [内容迁移](CONTENT_MAP.md)

本页说明 README 中哪些内容来自历史材料，哪些可以在当前公开源码中核实。核查日期：**2026-09-27**。文档整理不等于重新完成算法基准测试或实车验收。

## 1. 阅读范围

两份项目材料均按顺序提取并阅读，包括正文、表格、图注、参考文献、幻灯片与讲稿：

- **项目论文（本地原件）**：题名 *The implementation of autonomous driving system*，封面日期为 2024 年 11 月。包括 Introduction、Related Work、Research Methodology、ROS implementation、Design and Implementation、Validation、Future Work、Conclusion 与 References。
- **答辩 PPT（本地原件）**：共 **54 页**。第 1–9 页为背景，第 10–27 页为方法，第 28–31 页为仿真，第 32–49 页为实车部署，第 50–54 页为未来工作与结尾。第 48 页嵌入完整 MP4；第 31 页的提取结果没有内嵌视频引用。
- **仓库原 README 与源码**：核对主启动文件、Cartographer Lua、规划 YAML、地图文件、initialpose 工具及依赖引用。静态检查覆盖了 ROS1 主链路，未执行硬件控制。

材料中的模板写作要求和讲稿指令属于文档内容，不作为操作指令。论文原文件与完整 PPT 不随本次首页素材一并公开；首页使用项目相关图片和演示片段，并避免展示学号等无关个人信息。

## 2. 项目结论的来源

| README 内容 | 来源 | 解释范围 |
| :-- | :-- | :-- |
| M1、RS16、IMU、Kinect 平台 | 论文 Hardware / Sensor；PPT 43、45；base launch | 历史平台与配置，具体批次硬件以实物为准 |
| 比较 NDT、LeGO、Cartographer | 论文 Mapping；PPT 38–41 | 定性实验观察，不是统一条件下的排名 |
| Cartographer 3D + odometry | `third_generation_mapping.lua` | `use_odometry=true`、3D builder、一个点云输入 |
| 纯定位与初始位姿 | location Lua；`cartographer_initialpose.cpp` | trim 子地图、initialpose→轨迹服务 |
| Dijkstra + TEB | planner YAML 与 navigation launch | 源码可核实的选择 |
| YOLOv5 与视觉辅助避障 | 论文 Navigation；PPT 42、48；视频 | 展示与设计存在，完整适配链路未收录 |
| AWSIM / Autoware | 论文 Simulation；PPT 29–31 | 独立仿真实验记录 |
| ROS1/ROS2 bridge | 论文第 4 个工程问题；PPT 49 | 桥接探索，非完整 ROS2 发行包 |
| 电源、散热、IMU、反射问题 | 论文 Design and Implementation；PPT 47 | 经验与候选改进方案需区分 |
| 自动探索、分割、泊车 | 论文 Future Work；PPT 51–53 | 后续工作方向 |

## 3. 指标保留与限制

论文报告 **95% 定位准确率、<2% 建图误差、>90% 避障成功率**。PPT 第 22 页讲稿还报告 **3.35 s 重定位**。材料没有完整定义这些百分比的分母、真值、容差、试验数、统计方法和重定位计时边界，也未提供重算这些结果的完整数据。

新版保留这些报告值及其出处，不放大为通用精度保证。仓库地图的 `resolution: 0.050000` 是 **5 cm 的栅格单元大小**，不能与定位误差或测量精度等同。

PPT 第 8 页讲稿把系统描述为 Level 3。材料未提供相应运行设计域、接管流程和系统评估依据，新版将项目定位为校园机器人研究原型，不宣称获得道路自动驾驶等级认定。

<a id="corrections"></a>
## 4. 原材料与技术事实之间的差异

原 README 逐字保存在 [archive/README.original.md](archive/README.original.md)。以下更正保留原主题，同时避免继续传播错误或过度概括。

| 原文或材料中的说法 | 新版处理与依据 |
| :-- | :-- |
| LeGO-LOAM 不支持回环 | 上游明确有基础 ICP 回环，并说明大漂移下的限制。[上游 Loop Closure](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM#loop-closure) |
| LeGO-LOAM 因“左手系”而天然不适配 Autoware | 保留本项目遇到的坐标对齐问题；不把它上升为不可兼容结论，实际需要核对 TF、轴向、外参和消息约定。[ROS 坐标约定](https://www.ros.org/reps/rep-0103.html) |
| NDT Mapping 必然包含回环，天然适合复杂动态环境 | NDT 是点云配准方法，完整 SLAM 的回环/动态处理依赖所用实现；原教程未锁定实验版本。[PCL NDT](https://pointclouds.org/documentation/tutorials/normal_distributions_transform.html) |
| Cartographer 依靠 NDT 和 ICP 做动态定位 | 主流程应解释为局部扫描匹配、子地图和位姿图约束；按项目中 Cartographer 源码及[算法说明](https://google-cartographer-ros.readthedocs.io/en/latest/algo_walkthrough.html)阅读 |
| `initial_pose_x/y/a` 可直接初始化 Cartographer | 本仓库使用 `/initialpose` 与 `cartographer_initialpose` 服务适配，不使用这组示例参数 |
| `load_state_filename` 写成普通 ROS param | 本仓库 `node_main.cc` 定义命令行 flag，launch 使用 `-load_state_filename` |
| 2D pure localization 示例代表实车 3D 配置 | 实际 location Lua 继承 3D 配置并使用 `pure_localization_trimmer` |
| PPT 的 A* 与 README 的 Dijkstra | 仓库配置 `use_dijkstra: true`，因此主链路写 Dijkstra；A* 保留为背景与可选研究 |
| 相机、LiDAR、IMU 同时存在即“三传感器紧耦合 SLAM” | 区分多传感器平台与估计器内部融合；当前主配置未接入视觉观测 |
| YOLO 检测框直接成为 TEB 动态障碍 | 缺少可核实的深度、跟踪、TF 与障碍接口适配，明确公开源码范围 |
| 无里程计 Cartographer 的统一评级 | 论文表格与 PPT 第 41 页评价不同，且正文也有不一致；不据此绘制数值排行榜 |
| TVM、点云分割均已实现 | 论文 Future Work 与 Conclusion 描述不一致，缺少代码证据的部分归入研究方向 |
| IMU 名称 AH100B / CH104M；底盘 pro1 / M1 | 展示历史变化与源码取值，不根据包名推断硬件型号 |

<a id="media"></a>
## 5. 本地媒体清单

| 文件 | 原始来源 | 处理 |
| :-- | :-- | :-- |
| [hero.png](assets/hero.png) | 用户提供的 AutoLabor M1 实车照片 | 使用 imagegen 去除室内背景、合成深蓝点云背景并放大车体展示；[编辑提示词](assets/hero.prompt.txt) |
| [campus-map.png](assets/campus-map.png) | 论文 `image30.png`，Figure 28；PPT 40 的 `image65.png` | 原图复制，Cartographer with odometry 花园地图 |
| [global-planning.png](assets/global-planning.png) | 论文 `image34.png`，Global planning；PPT 46 | 原图复制 |
| [local-planning.png](assets/local-planning.png) | 论文 `image35.png`，TEB/避障演示；PPT 42 | 原图复制 |
| [awsim.png](assets/awsim.png) | 论文 `image13.png`，Simulation；PPT 30 | 原图复制；AWSIM 软件与场景由其上游提供 |
| [sensor-suite.png](assets/sensor-suite.png) | 论文 Hardware / Sensor，image17 | 原图复制，硬件示意图 |
| [field-platform.jpeg](assets/field-platform.jpeg) | 论文移动供电与实车装配，image38 | 原图复制 |
| [ros-node-graph.png](assets/ros-node-graph.png) | PPT 第 37 页，image59 | 真实 ROS 节点/话题快照 |
| [ros1-navigation-architecture.svg](assets/ros1-navigation-architecture.svg) | 当前 ROS1 启动文件与代价地图配置 | 静态矢量图，说明传感器、建图定位、规划与底盘反馈；替换首页 Mermaid 渲染 |
| [mapping-algorithms.svg](assets/mapping-algorithms.svg) | NDT、LeGO-LOAM、Cartographer 上游资料与当前建图配置 | 自绘静态矢量图，对照输入、预处理、位姿估计、地图优化与输出；[流程依据](#mapping-algorithms) |
| [autolabor-architecture.png](assets/autolabor-architecture.png) | 论文图 29，image31 | AutoLabor 参考示意，保留原水印与归属 |
| [ndt-mapping.png](assets/ndt-mapping.png) | 论文图 23；PPT 第 38 页 | 原图复制，NDT 花园试验 |
| [lego-mapping.png](assets/lego-mapping.png) | 论文图 25；PPT 第 39 页 | 原图复制，LeGO-LOAM 花园试验 |
| [完整中文视频](https://github.com/user-attachments/assets/183c8e36-d6cf-413a-a5fd-3159e0e1e749) | Bilibili BV1hQTqzZEsc，00:00–05:35 | 完整保留内容与声音，720p / 30 fps，H.264 + AAC；通过 GitHub 视频附件在首页播放 |
| [simulation-demo.gif](assets/simulation-demo.gif) | Bilibili BV1hQTqzZEsc，01:10–01:46 | 36 秒、原速、无声 |
| [mapping-demo.gif](assets/mapping-demo.gif) | 同一视频，02:46–03:22 | 36 秒、原速、无声；跳过终端启动与界面设置 |
| [field-navigation-demo.gif](assets/field-navigation-demo.gif) | 同一视频，04:36–05:16 | 40 秒、原速、无声 |

素材使用用于说明本项目，不将第三方软件画面或上游算法图示声明为原创算法成果。原始图中的字幕、检测框和桌面界面均来自历史材料。文件来源与 SHA-256 见 [assets/manifest.json](assets/manifest.json)。

当前首屏使用仓库内的 PNG，车体与搭载设备以用户提供的实车照片为参考，背景与版式经图像编辑生成。早期版式保留在 [Figma · 3DSLAM DuralROS README visuals](https://www.figma.com/design/m5ilYDwGmbfj7o2jtlMBOI)，不对应当前首图。

<a id="mapping-algorithms"></a>
### 建图算法架构图的依据

[算法架构图](assets/mapping-algorithms.svg)按主要处理阶段简化，用三列分别说明三种方案；青绿色标识本项目采用的 Cartographer 3D + 轮式里程计。图形与排版为本仓库绘制，算法归属不变。

- **NDT Mapping：** 高斯分布网格来自参考地图，当前点云经配准得到位姿；回环与图优化来自 `ndt_map` 的工程实现，不是 NDT 配准本身的组成部分。[PCL NDT 教程](https://pointclouds.org/documentation/tutorials/normal_distributions_transform.html) · [ndt_map 源码](https://github.com/jyakaranda/ndt_map/blob/master/src/ndt_map.cpp)
- **LeGO-LOAM：** 先投影和分割点云，再提取几何特征，以两步匹配估计位姿，并进行关键帧地图匹配和图优化。ICP 回环为可选功能，上游 `loopClosureEnableFlag` 默认关闭。[官方说明](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM) · [默认配置](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM/blob/master/LeGO-LOAM/include/utility.h)
- **Cartographer：** 局部前端构建子地图，全局后端组织约束并优化位姿图。[官方算法说明](https://google-cartographer-ros.readthedocs.io/en/latest/algo_walkthrough.html)；本仓库[实车建图入口](../src/launch/autolabor_navigation_launch/launch/real_environment/third_generation_cartographer_3d.launch)加载 [third_generation_mapping.lua](../src/launch/autolabor_navigation_launch/params/cartographer/third_generation_mapping.lua)，启用 3D、轮式里程计和相关性粗匹配，再由 Ceres 精配准。

图中的虚线标明配置边界：建图配置包含的 [pose_graph.lua](../src/launch/autolabor_navigation_launch/params/cartographer/pose_graph.lua) 将 `optimize_every_n_nodes` 设为 `0`，关闭周期性全局优化；[node_main.cc](../src/mapping/cartographer_ros/cartographer_ros/cartographer_ros/node_main.cc) 仍在正常结束时调用 `RunFinalOptimization()`。这与[定位配置](../src/launch/autolabor_navigation_launch/params/cartographer/third_generation_location.lua)中的 `50` 不同。`.pbstream` 表示可保存的建图状态。

## 6. 新视频与公开资料的边界

当前演示使用 [Bilibili 中文项目视频](https://www.bilibili.com/video/BV1hQTqzZEsc/?t=284)，完整时长约 5 分 35 秒。首页内嵌播放器保留全片，支持播放、暂停、拖动与声音开关；Bilibili 入口从 **04:44 实车目标导航**开始。用户提供的视频流为 1920×1080、30 fps、无音轨；单独音频流为 AAC。两者合成为完整有声视频后，压缩为 1280×720、30 fps、H.264 + AAC，并上传为 GitHub 视频附件。GitHub 原生播放器忽略链接中的起播时间，因此定点导航通过 Bilibili 入口提供。首页 GIF 为 640×360、5 fps，按原速播放。仿真与建图动图分别跳转至原片 **01:10**、**02:46**，导航动图跳转至车辆开始按目标行驶的 **04:44**。原 PPT 导出的完整 MP4 和旧 GIF 已从当前版本移除。

新视频的仿真画面与实车画面用于说明不同实验阶段。简介列出 Ubuntu 18.04/Melodic 实车与 Ubuntu 20.04 仿真，原 README 列出 Ubuntu 20.04/Noetic/Galactic；首页保留这两套历史记录。简介中的 “ROS2-NEOTIC” 不作为有效发行版名称，Noetic 属于 ROS1。

隐私检查覆盖了更新前所有远端分支、完整可达历史与 Releases；未发现论文/PPT 原文件或改名副本。原文件保留在本地，公开内容仅包括经过筛选的技术图和说明。含远控设备标识的其他截图未被新增到仓库。

## 7. 阅读论文时保留的上下文

Related Work 涉及 GMapping、ORB-SLAM、VINS-Mono、融合 SLAM、OpenPlanner、costmap、A* 与 YOLO；它们解释研究背景，不自动等于本项目均已集成。对背景知识使用新的上游引用，避免沿用明显不对应的参考文献，例如论文中 *ROS are good* 实际属于植物学文献，不能支持 Robot Operating System 的技术说明。

未来工作的原始主题包括 Apollo 系列点云分割、TVM 优化、`frontier_exploration`、原文拼作 `explorate_lite` 的探索方法、`rrt_exploration`，以及 PPT 中的倒车/侧方停车。新版[技术路线](ROADMAP.md)保留这些主题，并明确它们尚待实现与评估。
