; Auto-generated. Do not edit!


(cl:in-package marvelmind-msg)


;//! \htmlinclude beacon_pos.msg.html

(cl:defclass <beacon_pos> (roslisp-msg-protocol:ros-message)
  ((address
    :reader address
    :initarg :address
    :type cl:fixnum
    :initform 0)
   (x_m
    :reader x_m
    :initarg :x_m
    :type cl:float
    :initform 0.0)
   (y_m
    :reader y_m
    :initarg :y_m
    :type cl:float
    :initform 0.0)
   (z_m
    :reader z_m
    :initarg :z_m
    :type cl:float
    :initform 0.0))
)

(cl:defclass beacon_pos (<beacon_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <beacon_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'beacon_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind-msg:<beacon_pos> is deprecated: use marvelmind-msg:beacon_pos instead.")))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <beacon_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind-msg:address-val is deprecated.  Use marvelmind-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'x_m-val :lambda-list '(m))
(cl:defmethod x_m-val ((m <beacon_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind-msg:x_m-val is deprecated.  Use marvelmind-msg:x_m instead.")
  (x_m m))

(cl:ensure-generic-function 'y_m-val :lambda-list '(m))
(cl:defmethod y_m-val ((m <beacon_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind-msg:y_m-val is deprecated.  Use marvelmind-msg:y_m instead.")
  (y_m m))

(cl:ensure-generic-function 'z_m-val :lambda-list '(m))
(cl:defmethod z_m-val ((m <beacon_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind-msg:z_m-val is deprecated.  Use marvelmind-msg:z_m instead.")
  (z_m m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <beacon_pos>) ostream)
  "Serializes a message object of type '<beacon_pos>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <beacon_pos>) istream)
  "Deserializes a message object of type '<beacon_pos>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_m) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_m) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_m) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<beacon_pos>)))
  "Returns string type for a message object of type '<beacon_pos>"
  "marvelmind/beacon_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'beacon_pos)))
  "Returns string type for a message object of type 'beacon_pos"
  "marvelmind/beacon_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<beacon_pos>)))
  "Returns md5sum for a message object of type '<beacon_pos>"
  "2ebe9b8512406c92c2dbfed7a627f03c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'beacon_pos)))
  "Returns md5sum for a message object of type 'beacon_pos"
  "2ebe9b8512406c92c2dbfed7a627f03c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<beacon_pos>)))
  "Returns full string definition for message of type '<beacon_pos>"
  (cl:format cl:nil "uint8 address~%float64 x_m~%float64 y_m~%float64 z_m~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'beacon_pos)))
  "Returns full string definition for message of type 'beacon_pos"
  (cl:format cl:nil "uint8 address~%float64 x_m~%float64 y_m~%float64 z_m~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <beacon_pos>))
  (cl:+ 0
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <beacon_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'beacon_pos
    (cl:cons ':address (address msg))
    (cl:cons ':x_m (x_m msg))
    (cl:cons ':y_m (y_m msg))
    (cl:cons ':z_m (z_m msg))
))
