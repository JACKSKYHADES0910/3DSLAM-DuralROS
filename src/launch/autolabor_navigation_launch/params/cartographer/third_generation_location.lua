-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "third_generation_mapping.lua"

options.publish_frame_projected_to_2d = true

TRAJECTORY_BUILDER.pure_localization_trimmer = {
  max_submaps_to_keep = 3,
}


POSE_GRAPH.optimize_every_n_nodes = 50
POSE_GRAPH.constraint_builder.sampling_ratio = 0.05
-- POSE_GRAPH.constraint_builder.global_localization_min_score = 0.65

POSE_GRAPH.global_sampling_ratio = 0.02
POSE_GRAPH.global_constraint_search_after_n_seconds = 5


return options
