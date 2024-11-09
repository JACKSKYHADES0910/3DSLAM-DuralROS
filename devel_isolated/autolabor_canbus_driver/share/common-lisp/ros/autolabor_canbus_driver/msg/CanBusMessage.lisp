; Auto-generated. Do not edit!


(cl:in-package autolabor_canbus_driver-msg)


;//! \htmlinclude CanBusMessage.msg.html

(cl:defclass <CanBusMessage> (roslisp-msg-protocol:ros-message)
  ((node_type
    :reader node_type
    :initarg :node_type
    :type cl:fixnum
    :initform 0)
   (node_seq
    :reader node_seq
    :initarg :node_seq
    :type cl:fixnum
    :initform 0)
   (msg_type
    :reader msg_type
    :initarg :msg_type
    :type cl:fixnum
    :initform 0)
   (payload
    :reader payload
    :initarg :payload
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass CanBusMessage (<CanBusMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CanBusMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CanBusMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autolabor_canbus_driver-msg:<CanBusMessage> is deprecated: use autolabor_canbus_driver-msg:CanBusMessage instead.")))

(cl:ensure-generic-function 'node_type-val :lambda-list '(m))
(cl:defmethod node_type-val ((m <CanBusMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_canbus_driver-msg:node_type-val is deprecated.  Use autolabor_canbus_driver-msg:node_type instead.")
  (node_type m))

(cl:ensure-generic-function 'node_seq-val :lambda-list '(m))
(cl:defmethod node_seq-val ((m <CanBusMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_canbus_driver-msg:node_seq-val is deprecated.  Use autolabor_canbus_driver-msg:node_seq instead.")
  (node_seq m))

(cl:ensure-generic-function 'msg_type-val :lambda-list '(m))
(cl:defmethod msg_type-val ((m <CanBusMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_canbus_driver-msg:msg_type-val is deprecated.  Use autolabor_canbus_driver-msg:msg_type instead.")
  (msg_type m))

(cl:ensure-generic-function 'payload-val :lambda-list '(m))
(cl:defmethod payload-val ((m <CanBusMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autolabor_canbus_driver-msg:payload-val is deprecated.  Use autolabor_canbus_driver-msg:payload instead.")
  (payload m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CanBusMessage>) ostream)
  "Serializes a message object of type '<CanBusMessage>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'msg_type)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'payload))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'payload))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CanBusMessage>) istream)
  "Deserializes a message object of type '<CanBusMessage>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'node_seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'msg_type)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'payload) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'payload)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CanBusMessage>)))
  "Returns string type for a message object of type '<CanBusMessage>"
  "autolabor_canbus_driver/CanBusMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CanBusMessage)))
  "Returns string type for a message object of type 'CanBusMessage"
  "autolabor_canbus_driver/CanBusMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CanBusMessage>)))
  "Returns md5sum for a message object of type '<CanBusMessage>"
  "4fc00d85252b3621e3f37dfe24254deb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CanBusMessage)))
  "Returns md5sum for a message object of type 'CanBusMessage"
  "4fc00d85252b3621e3f37dfe24254deb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CanBusMessage>)))
  "Returns full string definition for message of type '<CanBusMessage>"
  (cl:format cl:nil "uint8 node_type~%uint8 node_seq~%uint8 msg_type~%uint8[] payload~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CanBusMessage)))
  "Returns full string definition for message of type 'CanBusMessage"
  (cl:format cl:nil "uint8 node_type~%uint8 node_seq~%uint8 msg_type~%uint8[] payload~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CanBusMessage>))
  (cl:+ 0
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'payload) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CanBusMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'CanBusMessage
    (cl:cons ':node_type (node_type msg))
    (cl:cons ':node_seq (node_seq msg))
    (cl:cons ':msg_type (msg_type msg))
    (cl:cons ':payload (payload msg))
))
