cmake_minimum_required(VERSION 3.16)
project(ch104m)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  serial
  sensor_msgs
  tf
  tf2
  std_msgs
  geometry_msgs
  message_generation
)
add_message_files(FILES Imu_0x91_msg.msg Imu_data_package.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES imu
   CATKIN_DEPENDS roscpp rospy serial std_msgs message_runtime
#  DEPENDS system_lib
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)


add_executable(${PROJECT_NAME} src/ch104m.cpp src/ch_serial.cpp)
target_link_libraries(${PROJECT_NAME}  ${catkin_LIBRARIES})

add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}_generate_messages_cpp)

