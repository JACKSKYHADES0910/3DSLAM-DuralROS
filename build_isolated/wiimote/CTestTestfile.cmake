# CMake generated Testfile for 
# Source directory: /home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote
# Build directory: /home/xyz/autolabor/build_isolated/wiimote
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_wiimote_roslint_package "/home/xyz/autolabor/build_isolated/wiimote/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/xyz/autolabor/build_isolated/wiimote/test_results/wiimote/roslint-wiimote.xml" "--working-dir" "/home/xyz/autolabor/build_isolated/wiimote" "--return-code" "/opt/ros/noetic/share/roslint/cmake/../../../lib/roslint/test_wrapper /home/xyz/autolabor/build_isolated/wiimote/test_results/wiimote/roslint-wiimote.xml make roslint_wiimote")
set_tests_properties(_ctest_wiimote_roslint_package PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslint/cmake/roslint-extras.cmake;67;catkin_run_tests_target;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/CMakeLists.txt;36;roslint_add_test;/home/xyz/autolabor/src/driver/joystick/joystick_drivers/wiimote/CMakeLists.txt;0;")
subdirs("gtest")
