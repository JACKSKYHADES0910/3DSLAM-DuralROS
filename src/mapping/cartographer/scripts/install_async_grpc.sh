#!/bin/sh

# Copyright 2018 The Cartographer Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o verbose

git clone https://gitee.com/Will_1989/async_grpc.git
cd async_grpc
git checkout 771af45374af7f7bfc3b622ed7efbe29a4aba403
mkdir build
cd build
#cmake -G Ninja \
 # -DCMAKE_BUILD_TYPE=Release \
 # ..
#ninja
#sudo ninja install
