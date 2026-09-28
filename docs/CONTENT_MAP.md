# 原 README 内容保留与本页位置

[返回项目首页](../README.md) · [原 README 全文快照](archive/README.original.md)

安装、算法原理、参数、命令和导航讲解位于**主 README**。主文按项目流程组织，配合技术图与实车视频说明；重复解释和修订说明已合并，归档保留逐字历史对照。

| 原内容 | 现在的主 README 位置 |
| :-- | :-- |
| 概述、室内外建图/定位/导航/避障 | [01 项目概述](../README.md#overview) |
| 原 YouTube | [15 引用中的历史入口](../README.md#credits)；当前演示改为指定 B 站视频 |
| 主机参数、ROS 版本、五个硬件链接 | [03 实验平台](../README.md#hardware) |
| Windows/Ubuntu 双系统与五个分区容量 | [05 环境准备](../README.md#environment) |
| AutoLabor 下载、旧驱动适配 | [05 环境准备](../README.md#environment) |
| FishROS 主页、仓库、原安装命令 | [05 环境准备](../README.md#environment) |
| 另一台电脑装 ISO、U 盘备份 catkin_ws、迁移与 cmd_vel | [05 环境准备](../README.md#environment) |
| ISO 原名称与 Melodic/Noetic 版本歧义 | [05 环境准备](../README.md#environment) |
| Autoware.AI/Universe、NVIDIA/CUDA/TensorRT/cuDNN、原 CSDN | [06 联合仿真](../README.md#awsim) |
| bashrc、DDS 环境变量、sysctl、multicast | [06 联合仿真](../README.md#awsim) |
| Vulkan、unzip、AWSIM v1.0.1、执行权限、程序启动 | [06 联合仿真](../README.md#awsim) |
| 地图下载/路径、topic list、source、e2e launch | [06 联合仿真](../README.md#awsim) |
| 两张上游 AWSIM 原截图 | [06 联合仿真](../README.md#awsim)，可展开查看 |
| 建图方法七维比较 | [07 建图方案](../README.md#mapping) |
| LeGO：全称、6DoF、地面优化、LOAM、边缘/平面、ICP | [07.2 LeGO-LOAM](../README.md#mapping) |
| LeGO：clone、Eigen/PCL/GTSAM、rosdep、构建与启动 | [07.2 LeGO-LOAM](../README.md#mapping) |
| NDT：正态分布、均值/协方差、栅格匹配、回环区别 | [07.3 NDT](../README.md#mapping) |
| NDT：clone、依赖、ROS 构建与运行 | [07.3 NDT](../README.md#mapping) |
| Cartographer：2D/3D、前端/后端、扫描匹配、回环 | [07.4 Cartographer](../README.md#mapping) |
| Cartographer：Ceres、wstool、rosdep、ninja 完整命令 | [07.4 Cartographer](../README.md#mapping) |
| 三条场景选择建议 | [07.5 怎样选择](../README.md#mapping) |
| 传感器同步、TF、IMU/里程计检查 | [08 工作空间与传感器](../README.md#start) |
| finish_trajectory、write_state、地图文件 | [09 建图与保存](../README.md#field-mapping) |
| 手动位置/朝向 + 自动匹配定位 | [10 定位](../README.md#localization) |
| 初始位姿、时钟与传感器输入 | [10.2 设置初始位姿](../README.md#localization)；旧 `velodyne_scan` 示例见[历史快照](archive/README.original.md) |
| 原 2D 定位七项参数及数值 | [历史快照](archive/README.original.md)；主 README 说明当前 3D 配置 |
| 四个 POSE_GRAPH 参数 | [10.3 定位调参](../README.md#localization)；非活动示例值见[历史快照](archive/README.original.md) |
| 地图恢复 XML、状态路径、坐标对齐、环境变化后更新 | [10 定位](../README.md#localization) |
| nav goal、move_base、costmap、Dijkstra | [11 导航](../README.md#navigation) |
| YOLOv5 检测与规划输入 | [11.3 从视觉检测到规划输入](../README.md#vision) |
| TEB 局部轨迹、动态障碍、原 YOLO 到规划器设计 | [11 导航](../README.md#navigation) |

主 README 说明当前配置与操作流程，历史错误和非活动示例不再重复展开。旧参数与原视频入口可在历史快照中查阅。

## 设计参考与检索口径

检索窗口为 **2026-06-27 至 2026-09-27**。用近期热门项目记录作为发现入口，再阅读项目自己的 README。没有获得覆盖全 GitHub 的统一 90 天新增星标数据，因此不将选用项目声称为“近三个月新增星标总榜前几名”。

发现入口包括 [2026-08-12 Trending 快照](https://github.com/jalliance/github-trending-snapshot-2026-08-12/blob/main/README.md)，它是第三方单日记录，不能替代三个月排名。以下设计判断来自对应仓库本身：

| 参考首页 | 采用的表达方式 |
| :-- | :-- |
| [Paperclip](https://github.com/paperclipai/paperclip) | 重要导航置顶，早展示完整演示，后展开功能和快速开始 |
| [Hugging Face Transformers](https://github.com/huggingface/transformers) | 清晰项目定位，简短上手入口，深入文档分层 |
| [3Blue1Brown Manim](https://github.com/3b1b/manim) | 让实际视觉成果解释工具价值，说明不同实现的关系 |
| [FAST-LIVO2](https://github.com/hku-mars/FAST-LIVO2) | 机器人项目的论文/视频/数据/硬件/安装入口组织方式 |
| [My Spider Project](https://github.com/JACKSKYHADES0910/University-Application-Information-Scraper) | 深色封面、绿蓝点缀、居中导航、折叠目录与分层教程 |
| [EnrollKit](https://github.com/JACKSKYHADES0910/enrollkit) | 简短项目定位、图文并排、能力表格与可折叠细节 |

新版的具体素材全部来自本项目，未复制其他首页的图片或营销文案。英文用于技术术语、短标语与引用；中文承担主要说明。

## 维护方式

新增成果时同步更新主 README 的对应章节、实现状态和素材清单。独立教程是便捷版本，不能成为删除主 README 内容的理由。新算法先列候选方向，完成验证后再标记实现。论文/PPT 完整原件保持本地，仅公开经筛选的技术图与说明。
