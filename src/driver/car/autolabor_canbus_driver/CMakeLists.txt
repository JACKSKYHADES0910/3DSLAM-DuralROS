cmake_minimum_required(VERSION 3.16)
project(autolabor_canbus_driver)

set(CMAKE_CXX_STANDARD 11)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    tf
    std_msgs
    geometry_msgs
    nav_msgs
    message_generation
    )

## Generate messages in the 'msg' folder
add_message_files(
    FILES
    CanBusMessage.msg
)

## Generate services in the 'srv' folder
add_service_files(
    FILES
    CanBusService.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
    DEPENDENCIES
    std_msgs
)

###################################
## catkin specific configuration ##
###################################
catkin_package(
    INCLUDE_DIRS include
    CATKIN_DEPENDS roscpp tf std_msgs geometry_msgs nav_msgs message_runtime
)

###########
## Build ##
###########
include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

add_executable(canbus_driver src/canbus_driver.cpp)
add_executable(pm1_driver src/pm1_driver.cpp
                          src/control_model/chassis_config_t.c
                          src/control_model/model.c
                          src/control_model/optimization.c)

add_dependencies(canbus_driver ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(pm1_driver ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

target_link_libraries(canbus_driver ${catkin_LIBRARIES})
target_link_libraries(pm1_driver ${catkin_LIBRARIES})

