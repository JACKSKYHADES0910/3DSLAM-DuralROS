; Auto-generated. Do not edit!


(cl:in-package autolabor_canbus_driver-srv)


;//! \htmlinclude CanBusService-request.msg.html

(cl:defclass <CanBusService-request> (roslisp-msg-protocol:ros-message)
  ((requests
    :reader requests
    :initarg :requests
    :type (cl:vector autolabor_canbus_driver-msg:CanBusMessage)
   :initform (cl:make-array 0 :element-type 'autolabor_canbus_driver-msg:CanBusMessage :initial-element (cl:make-instance 'autolabor_canbus_driver-msg:CanBusMessage))))
)

(cl:defclass CanBusService-request (<CanBusService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CanBusService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CanBusService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_canbus_driver-srv:<CanBusService-request> is deprecated: use autolabor_canbus_driver-srv:CanBusService-request instead.")))

(cl:ensure-generic-function 'requests-val :lambda-list '(m))
(cl:defmethod requests-val ((m <CanBusService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_canbus_driver-srv:requests-val is deprecated.  Use autolabor_canbus_driver-srv:requests instead.")
  (requests m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CanBusService-request>) ostream)
  "Serializes a message object of type '<CanBusService-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'requests))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'requests))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CanBusService-request>) istream)
  "Deserializes a message object of type '<CanBusService-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'requests) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'requests)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autolabor_canbus_driver-msg:CanBusMessage))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CanBusService-request>)))
  "Returns string type for a service object of type '<CanBusService-request>"
  "autolabor_canbus_driver/CanBusServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CanBusService-request)))
  "Returns string type for a service object of type 'CanBusService-request"
  "autolabor_canbus_driver/CanBusServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CanBusService-request>)))
  "Returns md5sum for a message object of type '<CanBusService-request>"
  "9a9cc9390520695f9967803f5179d063")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CanBusService-request)))
  "Returns md5sum for a message object of type 'CanBusService-request"
  "9a9cc9390520695f9967803f5179d063")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CanBusService-request>)))
  "Returns full string definition for message of type '<CanBusService-request>"
  (cl:format cl:nil "autolabor_canbus_driver/CanBusMessage[] requests~%~%================================================================================~%MSG: autolabor_canbus_driver/CanBusMessage~%uint8 node_type~%uint8 node_seq~%uint8 msg_type~%uint8[] payload~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CanBusService-request)))
  "Returns full string definition for message of type 'CanBusService-request"
  (cl:format cl:nil "autolabor_canbus_driver/CanBusMessage[] requests~%~%================================================================================~%MSG: autolabor_canbus_driver/CanBusMessage~%uint8 node_type~%uint8 node_seq~%uint8 msg_type~%uint8[] payload~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CanBusService-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'requests) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CanBusService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CanBusService-request
    (cl:cons ':requests (requests msg))
))
;//! \htmlinclude CanBusService-response.msg.html

(cl:defclass <CanBusService-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CanBusService-response (<CanBusService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CanBusService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CanBusService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_canbus_driver-srv:<CanBusService-response> is deprecated: use autolabor_canbus_driver-srv:CanBusService-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CanBusService-response>) ostream)
  "Serializes a message object of type '<CanBusService-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CanBusService-response>) istream)
  "Deserializes a message object of type '<CanBusService-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CanBusService-response>)))
  "Returns string type for a service object of type '<CanBusService-response>"
  "autolabor_canbus_driver/CanBusServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CanBusService-response)))
  "Returns string type for a service object of type 'CanBusService-response"
  "autolabor_canbus_driver/CanBusServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CanBusService-response>)))
  "Returns md5sum for a message object of type '<CanBusService-response>"
  "9a9cc9390520695f9967803f5179d063")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CanBusService-response)))
  "Returns md5sum for a message object of type 'CanBusService-response"
  "9a9cc9390520695f9967803f5179d063")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CanBusService-response>)))
  "Returns full string definition for message of type '<CanBusService-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CanBusService-response)))
  "Returns full string definition for message of type 'CanBusService-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CanBusService-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CanBusService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CanBusService-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CanBusService)))
  'CanBusService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CanBusService)))
  'CanBusService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CanBusService)))
  "Returns string type for a service object of type '<CanBusService>"
  "autolabor_canbus_driver/CanBusService")