# 原 README 内容保留与迁移索引

[返回首页](../README.md) · [原 README 全文](archive/README.original.md)

新版首页面向快速理解，长篇步骤整理到教程。原 README 独立完整保存，包含原链接、代码、比较表、重复段落与原措辞；其中的技术问题在新教程和证据说明中更正，不静默删除历史记录。

| 原章节/内容 | 新位置 |
| :-- | :-- |
| YouTube 视频 | [首页演示](../README.md#demo)，新增 PPT MP4 与 GIF |
| 概述、室内外建图定位导航避障 | [首页简介与架构](../README.md#architecture) |
| CPU、GPU、系统、ROS1/ROS2 | [硬件表](../README.md#hardware)，保留原 GPU 字符串并标注待核实 |
| 底盘、LiDAR、IMU、相机、主机链接 | [环境资料](REPRODUCTION.md#environment) |
| 双系统、分区数字、CSDN 链接 | 教程第 1 节 |
| AutoLabor 下载、旧驱动风险 | 教程第 1–2 节 |
| FishROS 主页、仓库与安装命令 | 教程第 1 节；原命令全文在归档 |
| Autoware.AI、Universe、GPU 依赖 | [教程第 8 节](REPRODUCTION.md#awsim) |
| 另一台电脑安装 ISO、备份迁移 catkin_ws | 教程第 1 节，补充版本歧义说明 |
| AWSIM 环境变量、DDS、Vulkan、unzip、程序权限 | 教程第 8 节 |
| AWSIM 程序/地图下载、topic list、e2e launch、截图 | 教程第 8 节，保留固定历史版本 |
| 三种建图方法的比较表与选择建议 | [首页算法取舍](../README.md#mapping)；原表逐字保留于归档 |
| LeGO-LOAM 原理、LOAM、特征、ICP、安装与地址 | [教程建图](REPRODUCTION.md#mapping)与归档；更正回环/安装说明 |
| NDT 原理、栅格分布、安装与地址 | 教程建图与归档；区分配准与完整 SLAM |
| Cartographer 原理、图优化、回环、扫描匹配、安装 | 首页架构与教程第 3、5、6 节 |
| 重复出现的 2.2 定位段落 | 合并为[教程定位](REPRODUCTION.md#localization)；原重复段仍在归档 |
| 手动初始位置、传感器同步、initial_pose XML | 教程第 4、6 节，改为源码实际服务流程 |
| pure_localization 与 2D Lua 参数 | 教程第 6 节，明确当前 3D 配置差异 |
| 动态环境下匹配、IMU、纠偏、鲁棒参数 | 教程第 6 节；更正 NDT/ICP 归因 |
| finish_trajectory / write_state / pbstream 恢复 | 教程第 5–6 节，补充轨迹 ID 与状态字段 |
| 地图路径、初始坐标对齐、环境变化后更新 | 教程第 5–6、10 节 |
| nav goal、move_base、costmap | [教程导航](REPRODUCTION.md#navigation) |
| YOLOv5 原理与动态识别、TEB 接入叙述 | 教程第 7 节与[实现状态](../README.md#status)，标明缺失的适配链路 |
| Dijkstra 全局规划、TEB 局部规划 | 首页架构、源码链接与教程第 7 节 |

## 设计参考与检索口径

检索窗口为 **2026-06-27 至 2026-09-27**。用近期热门项目记录作为发现入口，再阅读项目自己的 README。没有获得覆盖全 GitHub 的统一 90 天新增星标数据，因此不将选用项目声称为“近三个月新增星标总榜前几名”。

发现入口包括 [2026-08-12 Trending 快照](https://github.com/jalliance/github-trending-snapshot-2026-08-12/blob/main/README.md)，它是第三方单日记录，不能替代三个月排名。以下设计判断来自对应仓库本身：

| 参考首页 | 采用的表达方式 |
| :-- | :-- |
| [Paperclip](https://github.com/paperclipai/paperclip) | 重要导航置顶，早展示完整演示，后展开功能和快速开始 |
| [Hugging Face Transformers](https://github.com/huggingface/transformers) | 清晰项目定位，简短上手入口，深入文档分层 |
| [3Blue1Brown Manim](https://github.com/3b1b/manim) | 让实际视觉成果解释工具价值，说明不同实现的关系 |
| [FAST-LIVO2](https://github.com/hku-mars/FAST-LIVO2) | 机器人项目的论文/视频/数据/硬件/安装入口组织方式 |

新版的具体素材全部来自本项目，未复制其他首页的图片或营销文案。英文用于技术术语、短标语与引用；中文承担主要说明。

## 维护方式

新增成果时同步更新首页状态表、教程入口与证据说明。新算法先列为候选方向，完成可复现验证后再加入已实现部分。替换素材时更新 [assets/manifest.json](assets/manifest.json)，保留原始出处。
