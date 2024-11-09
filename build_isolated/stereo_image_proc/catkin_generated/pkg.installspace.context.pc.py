# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "image_geometry;image_proc;sensor_msgs;stereo_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lstereo_image_proc".split(';') if "-lstereo_image_proc" != "" else []
PROJECT_NAME = "stereo_image_proc"
PROJECT_SPACE_DIR = "/home/xyz/autolabor/install_isolated"
PROJECT_VERSION = "1.12.23"
