cmake_minimum_required(VERSION 3.5)
project(cartographer_initialpose)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  cartographer_ros_msgs
  roscpp
  tf
  )


catkin_package(
  INCLUDE_DIRS include
  #  LIBRARIES cartographer_initialpose
  #  CATKIN_DEPENDS cartographer_ros roscpp tf
  #  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)


add_executable(cartographer_initialpose src/cartographer_initialpose.cpp)

add_dependencies(cartographer_initialpose ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

target_link_libraries(cartographer_initialpose
  ${catkin_LIBRARIES}
  )

