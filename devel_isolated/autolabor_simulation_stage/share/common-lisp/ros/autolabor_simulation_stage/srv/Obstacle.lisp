; Auto-generated. Do not edit!


(cl:in-package autolabor_simulation_stage-srv)


;//! \htmlinclude Obstacle-request.msg.html

(cl:defclass <Obstacle-request> (roslisp-msg-protocol:ros-message)
  ((obstacle_id
    :reader obstacle_id
    :initarg :obstacle_id
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (transform
    :reader transform
    :initarg :transform
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (vertex
    :reader vertex
    :initarg :vertex
    :type (cl:vector geometry_msgs-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Polygon :initial-element (cl:make-instance 'geometry_msgs-msg:Polygon))))
)

(cl:defclass Obstacle-request (<Obstacle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_simulation_stage-srv:<Obstacle-request> is deprecated: use autolabor_simulation_stage-srv:Obstacle-request instead.")))

(cl:ensure-generic-function 'obstacle_id-val :lambda-list '(m))
(cl:defmethod obstacle_id-val ((m <Obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:obstacle_id-val is deprecated.  Use autolabor_simulation_stage-srv:obstacle_id instead.")
  (obstacle_id m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:type-val is deprecated.  Use autolabor_simulation_stage-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <Obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:transform-val is deprecated.  Use autolabor_simulation_stage-srv:transform instead.")
  (transform m))

(cl:ensure-generic-function 'vertex-val :lambda-list '(m))
(cl:defmethod vertex-val ((m <Obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_simulation_stage-srv:vertex-val is deprecated.  Use autolabor_simulation_stage-srv:vertex instead.")
  (vertex m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Obstacle-request>)))
    "Constants for message type '<Obstacle-request>"
  '((:NEW . 0)
    (:TRANSFORM . 1)
    (:DELETE . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Obstacle-request)))
    "Constants for message type 'Obstacle-request"
  '((:NEW . 0)
    (:TRANSFORM . 1)
    (:DELETE . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacle-request>) ostream)
  "Serializes a message object of type '<Obstacle-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'obstacle_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'obstacle_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'transform))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vertex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vertex))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacle-request>) istream)
  "Deserializes a message object of type '<Obstacle-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obstacle_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'obstacle_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'transform) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'transform)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vertex) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vertex)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacle-request>)))
  "Returns string type for a service object of type '<Obstacle-request>"
  "autolabor_simulation_stage/ObstacleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle-request)))
  "Returns string type for a service object of type 'Obstacle-request"
  "autolabor_simulation_stage/ObstacleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacle-request>)))
  "Returns md5sum for a message object of type '<Obstacle-request>"
  "16784fb8acead2e3b4470fa59f07d999")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacle-request)))
  "Returns md5sum for a message object of type 'Obstacle-request"
  "16784fb8acead2e3b4470fa59f07d999")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacle-request>)))
  "Returns full string definition for message of type '<Obstacle-request>"
  (cl:format cl:nil "uint8 NEW=0~%uint8 TRANSFORM=1~%uint8 DELETE=2~%~%string obstacle_id~%uint8 type~%float32[3] transform~%geometry_msgs/Polygon[] vertex~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacle-request)))
  "Returns full string definition for message of type 'Obstacle-request"
  (cl:format cl:nil "uint8 NEW=0~%uint8 TRANSFORM=1~%uint8 DELETE=2~%~%string obstacle_id~%uint8 type~%float32[3] transform~%geometry_msgs/Polygon[] vertex~%~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacle-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'obstacle_id))
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'transform) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vertex) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacle-request
    (cl:cons ':obstacle_id (obstacle_id msg))
    (cl:cons ':type (type msg))
    (cl:cons ':transform (transform msg))
    (cl:cons ':vertex (vertex msg))
))
;//! \htmlinclude Obstacle-response.msg.html

(cl:defclass <Obstacle-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Obstacle-response (<Obstacle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_simulation_stage-srv:<Obstacle-response> is deprecated: use autolabor_simulation_stage-srv:Obstacle-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacle-response>) ostream)
  "Serializes a message object of type '<Obstacle-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacle-response>) istream)
  "Deserializes a message object of type '<Obstacle-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacle-response>)))
  "Returns string type for a service object of type '<Obstacle-response>"
  "autolabor_simulation_stage/ObstacleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle-response)))
  "Returns string type for a service object of type 'Obstacle-response"
  "autolabor_simulation_stage/ObstacleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacle-response>)))
  "Returns md5sum for a message object of type '<Obstacle-response>"
  "16784fb8acead2e3b4470fa59f07d999")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacle-response)))
  "Returns md5sum for a message object of type 'Obstacle-response"
  "16784fb8acead2e3b4470fa59f07d999")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacle-response>)))
  "Returns full string definition for message of type '<Obstacle-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacle-response)))
  "Returns full string definition for message of type 'Obstacle-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacle-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacle-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Obstacle)))
  'Obstacle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Obstacle)))
  'Obstacle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle)))
  "Returns string type for a service object of type '<Obstacle>"
  "autolabor_simulation_stage/Obstacle")