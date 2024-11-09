# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wiimote: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iwiimote:/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wiimote_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" ""
)

get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" "std_msgs/Header:geometry_msgs/Vector3:wiimote/IrSourceInfo"
)

get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_custom_target(_wiimote_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wiimote" "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)
_generate_msg_cpp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)
_generate_msg_cpp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_cpp(wiimote
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wiimote_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_cpp _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_gencpp)
add_dependencies(wiimote_gencpp wiimote_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote
)
_generate_msg_eus(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote
)
_generate_msg_eus(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_eus(wiimote
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wiimote_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_eus _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_eus _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_eus _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_geneus)
add_dependencies(wiimote_geneus wiimote_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)
_generate_msg_lisp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)
_generate_msg_lisp(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_lisp(wiimote
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wiimote_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_lisp _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_genlisp)
add_dependencies(wiimote_genlisp wiimote_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote
)
_generate_msg_nodejs(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote
)
_generate_msg_nodejs(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_nodejs(wiimote
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wiimote_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_nodejs _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_nodejs _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_nodejs _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_gennodejs)
add_dependencies(wiimote_gennodejs wiimote_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)
_generate_msg_py(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)
_generate_msg_py(wiimote
  "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
)

### Generating Services

### Generating Module File
_generate_module_py(wiimote
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wiimote_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wiimote_generate_messages wiimote_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/IrSourceInfo.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/State.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/msg/TimedSwitch.msg" NAME_WE)
add_dependencies(wiimote_generate_messages_py _wiimote_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wiimote_genpy)
add_dependencies(wiimote_genpy wiimote_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wiimote_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wiimote
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(wiimote_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wiimote_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(wiimote_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wiimote
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(wiimote_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wiimote_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(wiimote_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wiimote
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(wiimote_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wiimote_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(wiimote_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wiimote
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(wiimote_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wiimote_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(wiimote_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wiimote
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(wiimote_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wiimote_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(wiimote_generate_messages_py sensor_msgs_generate_messages_py)
endif()
