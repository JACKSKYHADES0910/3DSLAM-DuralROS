# CMake generated Testfile for 
# Source directory: /home/xyz/autolabor/src/navigation/teb_local_planner
# Build directory: /home/xyz/autolabor/build_isolated/teb_local_planner
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_teb_local_planner_gtest_test_teb_basics "/home/xyz/autolabor/build_isolated/teb_local_planner/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/xyz/autolabor/build_isolated/teb_local_planner/test_results/teb_local_planner/gtest-test_teb_basics.xml" "--return-code" "/home/xyz/autolabor/devel_isolated/teb_local_planner/lib/teb_local_planner/test_teb_basics --gtest_output=xml:/home/xyz/autolabor/build_isolated/teb_local_planner/test_results/teb_local_planner/gtest-test_teb_basics.xml")
set_tests_properties(_ctest_teb_local_planner_gtest_test_teb_basics PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;98;catkin_run_tests_target;/opt/ros/noetic/share/catkin/cmake/test/gtest.cmake;37;_catkin_add_google_test;/home/xyz/autolabor/src/navigation/teb_local_planner/CMakeLists.txt;272;catkin_add_gtest;/home/xyz/autolabor/src/navigation/teb_local_planner/CMakeLists.txt;0;")
subdirs("gtest")
