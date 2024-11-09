#!/usr/bin/env sh
# generated from catkin.builder Python module

# remember type of shell if not already set
if [ -z "$CATKIN_SHELL" ]; then
  CATKIN_SHELL=sh
fi
. "/home/xyz/autolabor/devel_isolated/camera_calibration/setup.$CATKIN_SHELL"

# detect if running on Darwin platform
_UNAME=`uname -s`
IS_DARWIN=0
if [ "$_UNAME" = "Darwin" ]; then
  IS_DARWIN=1
fi

# Prepend to the environment
export CMAKE_PREFIX_PATH="/home/xyz/autolabor/devel_isolated/cartographer:$CMAKE_PREFIX_PATH"
if [ $IS_DARWIN -eq 0 ]; then
  export LD_LIBRARY_PATH="/home/xyz/autolabor/devel_isolated/cartographer/lib:/home/xyz/autolabor/devel_isolated/cartographer/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
else
  export DYLD_LIBRARY_PATH="/home/xyz/autolabor/devel_isolated/cartographer/lib:/home/xyz/autolabor/devel_isolated/cartographer/lib/x86_64-linux-gnu:$DYLD_LIBRARY_PATH"
fi
export PATH="/home/xyz/autolabor/devel_isolated/cartographer/bin:$PATH"
export PKG_CONFIG_PATH="/home/xyz/autolabor/devel_isolated/cartographer/lib/pkgconfig:/home/xyz/autolabor/devel_isolated/cartographer/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH"
export PYTHONPATH="/home/xyz/autolabor/devel_isolated/cartographer/lib/python3/dist-packages:$PYTHONPATH"
