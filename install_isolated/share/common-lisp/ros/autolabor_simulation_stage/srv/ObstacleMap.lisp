; Auto-generated. Do not edit!


(cl:in-package autolabor_simulation_stage-srv)


;//! \htmlinclude ObstacleMap-request.msg.html

(cl:defclass <ObstacleMap-request> (roslisp-msg-protocol:ros-message)
  ((ignore_obstacle_id
    :reader ignore_obstacle_id
    :initarg :ignore_obstacle_id
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ObstacleMap-request (<ObstacleMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_simulation_stage-srv:<ObstacleMap-request> is deprecated: use autolabor_simulation_stage-srv:ObstacleMap-request instead.")))

(cl:ensure-generic-function 'ignore_obstacle_id-val :lambda-list '(m))
(cl:defmethod ignore_obstacle_id-val ((m <ObstacleMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:ignore_obstacle_id-val is deprecated.  Use autolabor_simulation_stage-srv:ignore_obstacle_id instead.")
  (ignore_obstacle_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleMap-request>) ostream)
  "Serializes a message object of type '<ObstacleMap-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ignore_obstacle_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'ignore_obstacle_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleMap-request>) istream)
  "Deserializes a message object of type '<ObstacleMap-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ignore_obstacle_id) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ignore_obstacle_id)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleMap-request>)))
  "Returns string type for a service object of type '<ObstacleMap-request>"
  "autolabor_simulation_stage/ObstacleMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleMap-request)))
  "Returns string type for a service object of type 'ObstacleMap-request"
  "autolabor_simulation_stage/ObstacleMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleMap-request>)))
  "Returns md5sum for a message object of type '<ObstacleMap-request>"
  "cb18b08a081674fbfa15ea3f0864a898")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleMap-request)))
  "Returns md5sum for a message object of type 'ObstacleMap-request"
  "cb18b08a081674fbfa15ea3f0864a898")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleMap-request>)))
  "Returns full string definition for message of type '<ObstacleMap-request>"
  (cl:format cl:nil "string[] ignore_obstacle_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleMap-request)))
  "Returns full string definition for message of type 'ObstacleMap-request"
  (cl:format cl:nil "string[] ignore_obstacle_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleMap-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ignore_obstacle_id) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleMap-request
    (cl:cons ':ignore_obstacle_id (ignore_obstacle_id msg))
))
;//! \htmlinclude ObstacleMap-response.msg.html

(cl:defclass <ObstacleMap-response> (roslisp-msg-protocol:ros-message)
  ((obstacle_map
    :reader obstacle_map
    :initarg :obstacle_map
    :type nav_msgs-msg:OccupancyGrid
    :initform (cl:make-instance 'nav_msgs-msg:OccupancyGrid)))
)

(cl:defclass ObstacleMap-response (<ObstacleMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_simulation_stage-srv:<ObstacleMap-response> is deprecated: use autolabor_simulation_stage-srv:ObstacleMap-response instead.")))

(cl:ensure-generic-function 'obstacle_map-val :lambda-list '(m))
(cl:defmethod obstacle_map-val ((m <ObstacleMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:obstacle_map-val is deprecated.  Use autolabor_simulation_stage-srv:obstacle_map instead.")
  (obstacle_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleMap-response>) ostream)
  "Serializes a message object of type '<ObstacleMap-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'obstacle_map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleMap-response>) istream)
  "Deserializes a message object of type '<ObstacleMap-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'obstacle_map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleMap-response>)))
  "Returns string type for a service object of type '<ObstacleMap-response>"
  "autolabor_simulation_stage/ObstacleMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleMap-response)))
  "Returns string type for a service object of type 'ObstacleMap-response"
  "autolabor_simulation_stage/ObstacleMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleMap-response>)))
  "Returns md5sum for a message object of type '<ObstacleMap-response>"
  "cb18b08a081674fbfa15ea3f0864a898")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleMap-response)))
  "Returns md5sum for a message object of type 'ObstacleMap-response"
  "cb18b08a081674fbfa15ea3f0864a898")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleMap-response>)))
  "Returns full string definition for message of type '<ObstacleMap-response>"
  (cl:format cl:nil "nav_msgs/OccupancyGrid obstacle_map~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleMap-response)))
  "Returns full string definition for message of type 'ObstacleMap-response"
  (cl:format cl:nil "nav_msgs/OccupancyGrid obstacle_map~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleMap-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'obstacle_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleMap-response
    (cl:cons ':obstacle_map (obstacle_map msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ObstacleMap)))
  'ObstacleMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ObstacleMap)))
  'ObstacleMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleMap)))
  "Returns string type for a service object of type '<ObstacleMap>"
  "autolabor_simulation_stage/ObstacleMap")