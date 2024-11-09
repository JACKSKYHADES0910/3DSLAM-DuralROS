; Auto-generated. Do not edit!


(cl:in-package ch104m-msg)


;//! \htmlinclude Imu_0x91_msg.msg.html

(cl:defclass <Imu_0x91_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (imu_data
    :reader imu_data
    :initarg :imu_data
    :type ch104m-msg:Imu_data_package
    :initform (cl:make-instance 'ch104m-msg:Imu_data_package)))
)

(cl:defclass Imu_0x91_msg (<Imu_0x91_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Imu_0x91_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Imu_0x91_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ch104m-msg:<Imu_0x91_msg> is deprecated: use ch104m-msg:Imu_0x91_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Imu_0x91_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:header-val is deprecated.  Use ch104m-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'imu_data-val :lambda-list '(m))
(cl:defmethod imu_data-val ((m <Imu_0x91_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:imu_data-val is deprecated.  Use ch104m-msg:imu_data instead.")
  (imu_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Imu_0x91_msg>) ostream)
  "Serializes a message object of type '<Imu_0x91_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imu_data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Imu_0x91_msg>) istream)
  "Deserializes a message object of type '<Imu_0x91_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imu_data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Imu_0x91_msg>)))
  "Returns string type for a message object of type '<Imu_0x91_msg>"
  "ch104m/Imu_0x91_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imu_0x91_msg)))
  "Returns string type for a message object of type 'Imu_0x91_msg"
  "ch104m/Imu_0x91_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Imu_0x91_msg>)))
  "Returns md5sum for a message object of type '<Imu_0x91_msg>"
  "bf1a29bdfa7a4861f3dcfb7c14758970")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Imu_0x91_msg)))
  "Returns md5sum for a message object of type 'Imu_0x91_msg"
  "bf1a29bdfa7a4861f3dcfb7c14758970")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Imu_0x91_msg>)))
  "Returns full string definition for message of type '<Imu_0x91_msg>"
  (cl:format cl:nil "#90 91 data_package~%Header header~%Imu_data_package imu_data~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ch104m/Imu_data_package~%uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Imu_0x91_msg)))
  "Returns full string definition for message of type 'Imu_0x91_msg"
  (cl:format cl:nil "#90 91 data_package~%Header header~%Imu_data_package imu_data~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ch104m/Imu_data_package~%uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Imu_0x91_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imu_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Imu_0x91_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'Imu_0x91_msg
    (cl:cons ':header (header msg))
    (cl:cons ':imu_data (imu_data msg))
))
