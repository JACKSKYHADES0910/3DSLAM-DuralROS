# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ch104m: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ich104m:/home/xyz/autolabor/src/driver/imu/ch104m/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ch104m_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_custom_target(_ch104m_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ch104m" "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" "std_msgs/Header:ch104m/Imu_data_package"
)

get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_custom_target(_ch104m_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ch104m" "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ch104m
)
_generate_msg_cpp(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ch104m
)

### Generating Services

### Generating Module File
_generate_module_cpp(ch104m
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ch104m
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ch104m_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ch104m_generate_messages ch104m_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_cpp _ch104m_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_cpp _ch104m_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ch104m_gencpp)
add_dependencies(ch104m_gencpp ch104m_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ch104m_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ch104m
)
_generate_msg_eus(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ch104m
)

### Generating Services

### Generating Module File
_generate_module_eus(ch104m
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ch104m
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ch104m_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ch104m_generate_messages ch104m_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_eus _ch104m_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_eus _ch104m_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ch104m_geneus)
add_dependencies(ch104m_geneus ch104m_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ch104m_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ch104m
)
_generate_msg_lisp(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ch104m
)

### Generating Services

### Generating Module File
_generate_module_lisp(ch104m
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ch104m
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ch104m_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ch104m_generate_messages ch104m_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_lisp _ch104m_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_lisp _ch104m_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ch104m_genlisp)
add_dependencies(ch104m_genlisp ch104m_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ch104m_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ch104m
)
_generate_msg_nodejs(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ch104m
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ch104m
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ch104m
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ch104m_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ch104m_generate_messages ch104m_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_nodejs _ch104m_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_nodejs _ch104m_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ch104m_gennodejs)
add_dependencies(ch104m_gennodejs ch104m_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ch104m_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m
)
_generate_msg_py(ch104m
  "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m
)

### Generating Services

### Generating Module File
_generate_module_py(ch104m
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ch104m_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ch104m_generate_messages ch104m_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_0x91_msg.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_py _ch104m_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/imu/ch104m/msg/Imu_data_package.msg" NAME_WE)
add_dependencies(ch104m_generate_messages_py _ch104m_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ch104m_genpy)
add_dependencies(ch104m_genpy ch104m_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ch104m_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ch104m)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ch104m
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ch104m_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ch104m)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ch104m
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ch104m_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ch104m)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ch104m
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ch104m_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ch104m)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ch104m
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ch104m_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ch104m
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ch104m_generate_messages_py std_msgs_generate_messages_py)
endif()
