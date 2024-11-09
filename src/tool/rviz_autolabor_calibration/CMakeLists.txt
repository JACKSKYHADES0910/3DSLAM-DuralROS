cmake_minimum_required(VERSION 3.5)
project(rviz_autolabor_calibration)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
			 roscpp
			 rviz
			 tf
			 )


catkin_package(
		#  INCLUDE_DIRS include
		#  LIBRARIES rviz_autolabor_calibration
		#  CATKIN_DEPENDS roscpp rviz tf
		#  DEPENDS system_lib
)

include_directories(
		include
		${catkin_INCLUDE_DIRS}
)

link_directories(${catkin_LIBRARY_DIRS})

set(CMAKE_AUTOMOC ON)

if(rviz_QT_VERSION VERSION_LESS "5")
	message(STATUS "Using Qt4 based on the rviz_QT_VERSION: ${rviz_QT_VERSION}")
	find_package(Qt4 ${rviz_QT_VERSION} EXACT REQUIRED QtCore QtGui)
	## pull in all required include dirs, define QT_LIBRARIES, etc.
	include(${QT_USE_FILE})
else()
	message(STATUS "Using Qt5 based on the rviz_QT_VERSION: ${rviz_QT_VERSION}")
	find_package(Qt5 ${rviz_QT_VERSION} EXACT REQUIRED Core Widgets)
	## make target_link_libraries(${QT_LIBRARIES}) pull in all required dependencies
	set(QT_LIBRARIES Qt5::Widgets)
endif()

add_definitions(-DQT_NO_KEYWORDS)

## Declare a C++ library
add_library(autolabor_calibration_panel src/autolabor_calibration_panel.cpp include/rviz_autolabor_calibration/autolabor_calibration_panel.h)
target_link_libraries(autolabor_calibration_panel ${QT_LIBRARIES} ${catkin_LIBRARIES})
