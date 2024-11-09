; Auto-generated. Do not edit!


(cl:in-package wiimote-msg)


;//! \htmlinclude IrSourceInfo.msg.html

(cl:defclass <IrSourceInfo> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (ir_size
    :reader ir_size
    :initarg :ir_size
    :type cl:integer
    :initform 0))
)

(cl:defclass IrSourceInfo (<IrSourceInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IrSourceInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IrSourceInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wiimote-msg:<IrSourceInfo> is deprecated: use wiimote-msg:IrSourceInfo instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <IrSourceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:x-val is deprecated.  Use wiimote-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <IrSourceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:y-val is deprecated.  Use wiimote-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'ir_size-val :lambda-list '(m))
(cl:defmethod ir_size-val ((m <IrSourceInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:ir_size-val is deprecated.  Use wiimote-msg:ir_size instead.")
  (ir_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IrSourceInfo>) ostream)
  "Serializes a message object of type '<IrSourceInfo>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'ir_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IrSourceInfo>) istream)
  "Deserializes a message object of type '<IrSourceInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ir_size) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IrSourceInfo>)))
  "Returns string type for a message object of type '<IrSourceInfo>"
  "wiimote/IrSourceInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IrSourceInfo)))
  "Returns string type for a message object of type 'IrSourceInfo"
  "wiimote/IrSourceInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IrSourceInfo>)))
  "Returns md5sum for a message object of type '<IrSourceInfo>"
  "95274ca88b9f008b99984b9a61d2772e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IrSourceInfo)))
  "Returns md5sum for a message object of type 'IrSourceInfo"
  "95274ca88b9f008b99984b9a61d2772e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IrSourceInfo>)))
  "Returns full string definition for message of type '<IrSourceInfo>"
  (cl:format cl:nil "# Sensor data pertaining to the Wiimote infrared camera.~%# This message contains data for one of the four infrared ~%# light sources that the camera detects.~%#~%# Each light is specified with a 2D position and ~%# a 'source magnitude' (ir_size). If the x dimension~%# is set to INVALID_FLOAT, then no light was detected for ~%# the respective light. The Wiimote handles up to~%# four light sources, and the wiimote_node.py software~%# is written to that limit as well.~%#~%# I am unsure what the 'ir_size' values represent. ~%# They are described as 'source magnitude' in some places. I~%# *assume* this is signal amplitude, but it's unclear. ~%# Note that current lowest level cwiid driver does not ~%# seem to pass the ir_size value to the cwiid Wiimote.c. ~%# For now this size will therefore be set INVALID~%~%float64 x ~%float64 y ~%int64 ir_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IrSourceInfo)))
  "Returns full string definition for message of type 'IrSourceInfo"
  (cl:format cl:nil "# Sensor data pertaining to the Wiimote infrared camera.~%# This message contains data for one of the four infrared ~%# light sources that the camera detects.~%#~%# Each light is specified with a 2D position and ~%# a 'source magnitude' (ir_size). If the x dimension~%# is set to INVALID_FLOAT, then no light was detected for ~%# the respective light. The Wiimote handles up to~%# four light sources, and the wiimote_node.py software~%# is written to that limit as well.~%#~%# I am unsure what the 'ir_size' values represent. ~%# They are described as 'source magnitude' in some places. I~%# *assume* this is signal amplitude, but it's unclear. ~%# Note that current lowest level cwiid driver does not ~%# seem to pass the ir_size value to the cwiid Wiimote.c. ~%# For now this size will therefore be set INVALID~%~%float64 x ~%float64 y ~%int64 ir_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IrSourceInfo>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IrSourceInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'IrSourceInfo
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':ir_size (ir_size msg))
))
