# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "autolabor_pro1_driver: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iautolabor_pro1_driver:/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(autolabor_pro1_driver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_custom_target(_autolabor_pro1_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "autolabor_pro1_driver" "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(autolabor_pro1_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_pro1_driver
)

### Generating Services

### Generating Module File
_generate_module_cpp(autolabor_pro1_driver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_pro1_driver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(autolabor_pro1_driver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(autolabor_pro1_driver_generate_messages autolabor_pro1_driver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_dependencies(autolabor_pro1_driver_generate_messages_cpp _autolabor_pro1_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_pro1_driver_gencpp)
add_dependencies(autolabor_pro1_driver_gencpp autolabor_pro1_driver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_pro1_driver_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(autolabor_pro1_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_pro1_driver
)

### Generating Services

### Generating Module File
_generate_module_eus(autolabor_pro1_driver
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_pro1_driver
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(autolabor_pro1_driver_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(autolabor_pro1_driver_generate_messages autolabor_pro1_driver_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_dependencies(autolabor_pro1_driver_generate_messages_eus _autolabor_pro1_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_pro1_driver_geneus)
add_dependencies(autolabor_pro1_driver_geneus autolabor_pro1_driver_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_pro1_driver_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(autolabor_pro1_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_pro1_driver
)

### Generating Services

### Generating Module File
_generate_module_lisp(autolabor_pro1_driver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_pro1_driver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(autolabor_pro1_driver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(autolabor_pro1_driver_generate_messages autolabor_pro1_driver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_dependencies(autolabor_pro1_driver_generate_messages_lisp _autolabor_pro1_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_pro1_driver_genlisp)
add_dependencies(autolabor_pro1_driver_genlisp autolabor_pro1_driver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_pro1_driver_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(autolabor_pro1_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_pro1_driver
)

### Generating Services

### Generating Module File
_generate_module_nodejs(autolabor_pro1_driver
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_pro1_driver
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(autolabor_pro1_driver_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(autolabor_pro1_driver_generate_messages autolabor_pro1_driver_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_dependencies(autolabor_pro1_driver_generate_messages_nodejs _autolabor_pro1_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_pro1_driver_gennodejs)
add_dependencies(autolabor_pro1_driver_gennodejs autolabor_pro1_driver_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_pro1_driver_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(autolabor_pro1_driver
  "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_pro1_driver
)

### Generating Services

### Generating Module File
_generate_module_py(autolabor_pro1_driver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_pro1_driver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(autolabor_pro1_driver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(autolabor_pro1_driver_generate_messages autolabor_pro1_driver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xyz/autolabor/src/driver/car/autolabor_pro1_driver/msg/Encode.msg" NAME_WE)
add_dependencies(autolabor_pro1_driver_generate_messages_py _autolabor_pro1_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(autolabor_pro1_driver_genpy)
add_dependencies(autolabor_pro1_driver_genpy autolabor_pro1_driver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS autolabor_pro1_driver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_pro1_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/autolabor_pro1_driver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_pro1_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/autolabor_pro1_driver
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_pro1_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/autolabor_pro1_driver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_pro1_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/autolabor_pro1_driver
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_pro1_driver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_pro1_driver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/autolabor_pro1_driver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
