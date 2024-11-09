cmake_minimum_required(VERSION 3.16)
project(marvelmind)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    geometry_msgs
    message_generation
)

add_message_files(
    FILES
    beacon_pos.msg
)

generate_messages()

catkin_package(
    INCLUDE_DIRS include
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

add_executable(marvelmind_driver src/marvelmind_driver.cpp
    src/marvelmind_hedge.c)

add_dependencies(marvelmind_driver ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

target_link_libraries(marvelmind_driver
    ${catkin_LIBRARIES}
    )