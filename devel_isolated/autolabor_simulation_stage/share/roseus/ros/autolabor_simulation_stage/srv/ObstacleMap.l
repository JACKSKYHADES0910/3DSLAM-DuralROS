;; Auto-generated. Do not edit!


(when (boundp 'autolabor_simulation_stage::ObstacleMap)
  (if (not (find-package "AUTOLABOR_SIMULATION_STAGE"))
    (make-package "AUTOLABOR_SIMULATION_STAGE"))
  (shadow 'ObstacleMap (find-package "AUTOLABOR_SIMULATION_STAGE")))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAP")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAP"))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAPREQUEST")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAPREQUEST"))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAPRESPONSE")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEMAPRESPONSE"))

(in-package "ROS")



(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass autolabor_simulation_stage::ObstacleMapRequest
  :super ros::object
  :slots (_ignore_obstacle_id ))

(defmethod autolabor_simulation_stage::ObstacleMapRequest
  (:init
   (&key
    ((:ignore_obstacle_id __ignore_obstacle_id) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _ignore_obstacle_id __ignore_obstacle_id)
   self)
  (:ignore_obstacle_id
   (&optional __ignore_obstacle_id)
   (if __ignore_obstacle_id (setq _ignore_obstacle_id __ignore_obstacle_id)) _ignore_obstacle_id)
  (:serialization-length
   ()
   (+
    ;; string[] _ignore_obstacle_id
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _ignore_obstacle_id)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _ignore_obstacle_id
     (write-long (length _ignore_obstacle_id) s)
     (dolist (elem _ignore_obstacle_id)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _ignore_obstacle_id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ignore_obstacle_id (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _ignore_obstacle_id i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass autolabor_simulation_stage::ObstacleMapResponse
  :super ros::object
  :slots (_obstacle_map ))

(defmethod autolabor_simulation_stage::ObstacleMapResponse
  (:init
   (&key
    ((:obstacle_map __obstacle_map) (instance nav_msgs::OccupancyGrid :init))
    )
   (send-super :init)
   (setq _obstacle_map __obstacle_map)
   self)
  (:obstacle_map
   (&rest __obstacle_map)
   (if (keywordp (car __obstacle_map))
       (send* _obstacle_map __obstacle_map)
     (progn
       (if __obstacle_map (setq _obstacle_map (car __obstacle_map)))
       _obstacle_map)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/OccupancyGrid _obstacle_map
    (send _obstacle_map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/OccupancyGrid _obstacle_map
       (send _obstacle_map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/OccupancyGrid _obstacle_map
     (send _obstacle_map :deserialize buf ptr-) (incf ptr- (send _obstacle_map :serialization-length))
   ;;
   self)
  )

(defclass autolabor_simulation_stage::ObstacleMap
  :super ros::object
  :slots ())

(setf (get autolabor_simulation_stage::ObstacleMap :md5sum-) "cb18b08a081674fbfa15ea3f0864a898")
(setf (get autolabor_simulation_stage::ObstacleMap :datatype-) "autolabor_simulation_stage/ObstacleMap")
(setf (get autolabor_simulation_stage::ObstacleMap :request) autolabor_simulation_stage::ObstacleMapRequest)
(setf (get autolabor_simulation_stage::ObstacleMap :response) autolabor_simulation_stage::ObstacleMapResponse)

(defmethod autolabor_simulation_stage::ObstacleMapRequest
  (:response () (instance autolabor_simulation_stage::ObstacleMapResponse :init)))

(setf (get autolabor_simulation_stage::ObstacleMapRequest :md5sum-) "cb18b08a081674fbfa15ea3f0864a898")
(setf (get autolabor_simulation_stage::ObstacleMapRequest :datatype-) "autolabor_simulation_stage/ObstacleMapRequest")
(setf (get autolabor_simulation_stage::ObstacleMapRequest :definition-)
      "string[] ignore_obstacle_id
---
nav_msgs/OccupancyGrid obstacle_map

================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get autolabor_simulation_stage::ObstacleMapResponse :md5sum-) "cb18b08a081674fbfa15ea3f0864a898")
(setf (get autolabor_simulation_stage::ObstacleMapResponse :datatype-) "autolabor_simulation_stage/ObstacleMapResponse")
(setf (get autolabor_simulation_stage::ObstacleMapResponse :definition-)
      "string[] ignore_obstacle_id
---
nav_msgs/OccupancyGrid obstacle_map

================================================================================
MSG: nav_msgs/OccupancyGrid
# This represents a 2-D grid map, in which each cell represents the probability of
# occupancy.

Header header 

#MetaData for the map
MapMetaData info

# The map data, in row-major order, starting with (0,0).  Occupancy
# probabilities are in the range [0,100].  Unknown is -1.
int8[] data

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :autolabor_simulation_stage/ObstacleMap "cb18b08a081674fbfa15ea3f0864a898")


