# CMake generated Testfile for 
# Source directory: /home/xyz/autolabor/src/navigation/clear_costmap_recovery
# Build directory: /home/xyz/autolabor/build_isolated/clear_costmap_recovery
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_clear_costmap_recovery_rostest_test_clear_tests.launch "/home/xyz/autolabor/build_isolated/clear_costmap_recovery/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/xyz/autolabor/build_isolated/clear_costmap_recovery/test_results/clear_costmap_recovery/rostest-test_clear_tests.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/xyz/autolabor/src/navigation/clear_costmap_recovery --package=clear_costmap_recovery --results-filename test_clear_tests.xml --results-base-dir \"/home/xyz/autolabor/build_isolated/clear_costmap_recovery/test_results\" /home/xyz/autolabor/src/navigation/clear_costmap_recovery/test/clear_tests.launch ")
set_tests_properties(_ctest_clear_costmap_recovery_rostest_test_clear_tests.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;80;add_rostest;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;100;_add_rostest_google_test;/home/xyz/autolabor/src/navigation/clear_costmap_recovery/CMakeLists.txt;48;add_rostest_gtest;/home/xyz/autolabor/src/navigation/clear_costmap_recovery/CMakeLists.txt;0;")
subdirs("gtest")
