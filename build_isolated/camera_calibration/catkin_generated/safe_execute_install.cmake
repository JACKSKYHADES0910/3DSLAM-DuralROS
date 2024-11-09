execute_process(COMMAND "/home/xyz/autolabor/build_isolated/camera_calibration/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/xyz/autolabor/build_isolated/camera_calibration/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
