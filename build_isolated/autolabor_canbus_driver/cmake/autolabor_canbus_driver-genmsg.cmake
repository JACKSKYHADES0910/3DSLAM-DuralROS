# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "autolabor_canbus_driver: 1 messages, 1 services")

set(MSG_I_FLAGS "-Iautolabor_canbus_driver:/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(autolabor_canbus_driver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_custom_target(_autolabor_canbus_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "autolabor_canbus_driver" "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" ""
)

get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_custom_target(_autolabor_canbus_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "autolabor_canbus_driver" "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" "autolabor_canbus_driver/CanBusMessage"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Services
_generate_srv_cpp(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv"
  "${MSG_I_FLAGS}"
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Module File
_generate_module_cpp(autolabor_canbus_driver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_canbus_driver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(autolabor_canbus_driver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(autolabor_canbus_driver_generate_messages autolabor_canbus_driver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_cpp _autolabor_canbus_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_cpp _autolabor_canbus_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_canbus_driver_gencpp)
add_dependencies(autolabor_canbus_driver_gencpp autolabor_canbus_driver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_canbus_driver_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Services
_generate_srv_eus(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv"
  "${MSG_I_FLAGS}"
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Module File
_generate_module_eus(autolabor_canbus_driver
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_canbus_driver
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(autolabor_canbus_driver_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(autolabor_canbus_driver_generate_messages autolabor_canbus_driver_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_eus _autolabor_canbus_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_eus _autolabor_canbus_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_canbus_driver_geneus)
add_dependencies(autolabor_canbus_driver_geneus autolabor_canbus_driver_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_canbus_driver_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Services
_generate_srv_lisp(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv"
  "${MSG_I_FLAGS}"
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Module File
_generate_module_lisp(autolabor_canbus_driver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_canbus_driver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(autolabor_canbus_driver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(autolabor_canbus_driver_generate_messages autolabor_canbus_driver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_lisp _autolabor_canbus_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_lisp _autolabor_canbus_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_canbus_driver_genlisp)
add_dependencies(autolabor_canbus_driver_genlisp autolabor_canbus_driver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_canbus_driver_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Services
_generate_srv_nodejs(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv"
  "${MSG_I_FLAGS}"
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Module File
_generate_module_nodejs(autolabor_canbus_driver
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_canbus_driver
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(autolabor_canbus_driver_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(autolabor_canbus_driver_generate_messages autolabor_canbus_driver_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_nodejs _autolabor_canbus_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_nodejs _autolabor_canbus_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_canbus_driver_gennodejs)
add_dependencies(autolabor_canbus_driver_gennodejs autolabor_canbus_driver_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_canbus_driver_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Services
_generate_srv_py(autolabor_canbus_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv"
  "${MSG_I_FLAGS}"
  "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver
)

### Generating Module File
_generate_module_py(autolabor_canbus_driver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(autolabor_canbus_driver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(autolabor_canbus_driver_generate_messages autolabor_canbus_driver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/msg/CanBusMessage.msg" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_py _autolabor_canbus_driver_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_canbus_driver/srv/CanBusService.srv" NAME_WE)
add_dependencies(autolabor_canbus_driver_generate_messages_py _autolabor_canbus_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_canbus_driver_genpy)
add_dependencies(autolabor_canbus_driver_genpy autolabor_canbus_driver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_canbus_driver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_canbus_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_canbus_driver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(autolabor_canbus_driver_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_canbus_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_canbus_driver
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(autolabor_canbus_driver_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_canbus_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_canbus_driver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(autolabor_canbus_driver_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_canbus_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_canbus_driver
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(autolabor_canbus_driver_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_canbus_driver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(autolabor_canbus_driver_generate_messages_py std_msgs_generate_messages_py)
endif()
