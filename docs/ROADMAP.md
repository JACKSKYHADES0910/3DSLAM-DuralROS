# 2026 技术路线与参考资料

[返回首页](../README.md) · [历史复现](REPRODUCTION.md) · [项目证据](EVIDENCE.md)

资料核查日期：**2026-09-27**。以下是基于项目实际问题提出的候选方向，**不是本仓库已经实现的功能，也不是交付时间承诺**。

## 1. 先建立可比较的基线

当前最有价值的起点是补齐 Git 子仓库地址/提交、恢复传感器标定、锁定依赖，保存一组可回放的 bag。先记录 Cartographer + Dijkstra + TEB 在相同场地的表现，再替换某个模块。这样才知道改进来自算法、标定还是数据差异。

## 2. ROS2 迁移与原生驱动

ROS1 Noetic 已结束官方支持。ROS2 官方发布表列出 **Jazzy 支持到 2029 年 5 月，Lyrical 支持到 2031 年 5 月**；具体选择取决于驱动、硬件接口和目标软件栈的支持情况。[ROS1 EOL](https://www.ros.org/blog/noetic-eol/) · [ROS2 Releases](https://github.com/ros2/ros2_documentation/blob/rolling/source/Releases.rst)

对于这台 M1，迁移的第一步是确认底盘和 RS16/IMU 驱动的消息、时钟与 TF，随后迁移定位和导航。`ros1_bridge` 可以帮助过渡，但它有系统版本约束，不能直接假定 Ubuntu 24.04 + Jazzy 能原生安装整套 ROS1 桥接。[ros1_bridge 兼容表](https://github.com/ros2/ros1_bridge#supported-ros-and-ubuntu-versions)

**建议验收：** 同一记录的传感器频率、端到端延迟和 TF 一致性；底盘速度指令与里程计反馈一致；迁移前后使用相同场地和任务。

## 3. 更紧密的传感器融合

[FAST-LIVO2](https://github.com/hku-mars/FAST-LIVO2) 将 LiDAR、惯性与视觉用于融合定位和建图，上游在 2025 年公开代码，并提供传感器同步、标定与数据相关资料。它与本项目已有 LiDAR/IMU/相机组合有研究上的联系，但并非直接替换一个 launch 就能使用。

这里最需要先做的是核对 RS16 的点级时间、IMU 采样和安装外参，再评估 Kinect 图像、曝光与同步能否满足要求。保留 Cartographer 基线，在走廊、低纹理、轮滑与反射场景中测量漂移、失效恢复和运算开销。LiDAR–inertial 基线也可参考 [FAST-LIO](https://github.com/hku-mars/FAST_LIO) 与 [LIO-SAM](https://github.com/TixiaoShan/LIO-SAM)。

**建议验收：** 相同轨迹的 ATE/RPE、丢失次数、恢复时间分布、CPU 负载与内存；算法比较必须使用可解释的真值或测量基准。

## 4. 局部规划与动态障碍

[Nav2 MPPI](https://github.com/ros-navigation/navigation2/tree/main/nav2_mppi_controller) 是 ROS2 导航生态中的局部控制候选。它通过采样运动轨迹并用代价函数评价控制方案，适合作为迁移后的对照实验；不是对本项目 TEB 的直接性能结论。

更换控制器之前，先补全视觉检测到规划输入的链路：二维框 → 深度/点云关联 → 地图坐标 → 跟踪/速度 → 障碍预测。检测网络升级与导航成功率提升应分别评估。原论文的 Apollo 系列点云分割与 TVM 优化可保留为历史研究线索，采用前重新确认上游维护状态和目标硬件兼容性。

**建议验收：** 行人横穿、遮挡后出现、狭窄会车等场景中的最小障碍间距、碰撞、急停、接管、到达率与控制延迟。

## 5. 闭环仿真与新的自动驾驶模型

项目已有 AWSIM/Autoware 的学习基础。下一步可以固定地图、任务与随机种子，建立传感器异常、动态交通和恢复行为的闭环测试。[Autoware 文档](https://autowarefoundation.github.io/autoware-documentation/main/) · [AWSIM](https://github.com/tier4/AWSIM)

2026 年的一个新方向是 **reasoning VLA（视觉语言动作）与闭环仿真**。NVIDIA 于 2026 年 1 月介绍 Alpamayo 模型、数据与 AlpaSim 工具，并在 8 月公布 Alpamayo 2 Super。它为研究长尾驾驶场景、轨迹生成和解释提供了新的参照。[1 月官方技术介绍](https://developer.nvidia.com/blog/building-autonomous-vehicles-that-reason-with-nvidia-alpamayo/) · [8 月官方发布](https://blogs.nvidia.com/blog/alpamayo-2-super-open-model-now-available/)

对本项目而言，合理切入点是**离线场景分析与仿真对比**，先核对模型许可、显存、传感器输入和延迟。现有资料不足以证明这类模型可以在原 HP OMEN 上实时运行，也没有对应实车集成。

## 6. 保留原有探索与泊车方向

论文提出通过 frontier、explore-lite 类方法与 RRT 探索未知环境，优化目标选择、信息增益、迟滞与路径稳定性；PPT 还提出倒车泊车和侧方停车。它们仍有价值，但应分成可验证任务：探索覆盖率/重复路程、地图完整度、停车位置与角度误差，以及失败恢复。原文所列 `explorate_lite` 拼写与所指实现需复核。

<a id="evaluation"></a>
## 7. 下一轮实验应记录什么

| 层级 | 指标 | 最少需要的数据 |
| :-- | :-- | :-- |
| 传感器 | 频率、丢包、时差 | 原始消息、时间源、标定文件 |
| 定位 | ATE/RPE、跟踪丢失、恢复时间 | 真值/测量基准、轨迹、初始化条件 |
| 建图 | 一致性、场地尺度偏差、闭环表现 | 相同路线与参数、重复试验、地图 |
| 导航 | 成功率、时间、路径长度、接管/碰撞 | 明确的起终点、障碍脚本、每次试验结果 |
| 实时性 | 处理时间分位数、CPU/GPU、内存 | 完整运行日志、硬件与功耗状态 |

把论文中的百分比结果转换为这类有定义、可复算的记录，是本项目后续质量提升最直接的一步。
