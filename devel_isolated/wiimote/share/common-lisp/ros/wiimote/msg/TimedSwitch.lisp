; Auto-generated. Do not edit!


(cl:in-package wiimote-msg)


;//! \htmlinclude TimedSwitch.msg.html

(cl:defclass <TimedSwitch> (roslisp-msg-protocol:ros-message)
  ((switch_mode
    :reader switch_mode
    :initarg :switch_mode
    :type cl:fixnum
    :initform 0)
   (num_cycles
    :reader num_cycles
    :initarg :num_cycles
    :type cl:integer
    :initform 0)
   (pulse_pattern
    :reader pulse_pattern
    :initarg :pulse_pattern
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TimedSwitch (<TimedSwitch>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimedSwitch>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimedSwitch)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wiimote-msg:<TimedSwitch> is deprecated: use wiimote-msg:TimedSwitch instead.")))

(cl:ensure-generic-function 'switch_mode-val :lambda-list '(m))
(cl:defmethod switch_mode-val ((m <TimedSwitch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:switch_mode-val is deprecated.  Use wiimote-msg:switch_mode instead.")
  (switch_mode m))

(cl:ensure-generic-function 'num_cycles-val :lambda-list '(m))
(cl:defmethod num_cycles-val ((m <TimedSwitch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:num_cycles-val is deprecated.  Use wiimote-msg:num_cycles instead.")
  (num_cycles m))

(cl:ensure-generic-function 'pulse_pattern-val :lambda-list '(m))
(cl:defmethod pulse_pattern-val ((m <TimedSwitch>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:pulse_pattern-val is deprecated.  Use wiimote-msg:pulse_pattern instead.")
  (pulse_pattern m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<TimedSwitch>)))
    "Constants for message type '<TimedSwitch>"
  '((:ON . 1)
    (:OFF . 0)
    (:NO_CHANGE . -2)
    (:REPEAT . -1)
    (:FOREVER . -1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'TimedSwitch)))
    "Constants for message type 'TimedSwitch"
  '((:ON . 1)
    (:OFF . 0)
    (:NO_CHANGE . -2)
    (:REPEAT . -1)
    (:FOREVER . -1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimedSwitch>) ostream)
  "Serializes a message object of type '<TimedSwitch>"
  (cl:let* ((signed (cl:slot-value msg 'switch_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num_cycles)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pulse_pattern))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pulse_pattern))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimedSwitch>) istream)
  "Deserializes a message object of type '<TimedSwitch>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'switch_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_cycles) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pulse_pattern) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pulse_pattern)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimedSwitch>)))
  "Returns string type for a message object of type '<TimedSwitch>"
  "wiimote/TimedSwitch")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimedSwitch)))
  "Returns string type for a message object of type 'TimedSwitch"
  "wiimote/TimedSwitch")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimedSwitch>)))
  "Returns md5sum for a message object of type '<TimedSwitch>"
  "e4c8d9327409cef6066fa6c368032c1e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimedSwitch)))
  "Returns md5sum for a message object of type 'TimedSwitch"
  "e4c8d9327409cef6066fa6c368032c1e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimedSwitch>)))
  "Returns full string definition for message of type '<TimedSwitch>"
  (cl:format cl:nil "# TimedSwitch allows sender to:~%#    o turn a switch on,~%#    o turn a switch off, and~%#    o repeat an on/off pattern forever or for a~%#          given number of times.~%# Fields (refer to definitions of constants in the definition body):~%#     o switch_mode:~%#         ON: turn on  (num_cycles and pulse_pattern fields are ignored)~%#        OFF: turn off (num_cycles and pulse_pattern fields are ignored)~%#  NO_CHANGE: leave LED in its current state~%#     REPEAT: repeat an on/off pattern for as long~%#             as is indicated in the num_cycles field. The~%#             pattern is defined in the pulse_pattern field.~%#~%#     o num_cycles:~%#          n>=0: run the pattern that is defined in pulse_pattern~%#                n times.~%#          n==FOREVER: run the pattern that is defined in pulse_pattern~%#                       until a new TimedSwitch message is sent.              ~%#~%#     o pulse_pattern:~%#          A series of time durations in fractions of a second. The~%#          first number is the duration for having the switch on.~%#          The second number is the duration for which the switch~%#          is off. The third is an 'on' period again, etc.~%#          A pattern is terminated with the end of the array.~%#           ~%#          Example: [1,1] specifies an on-off sequence of 1 second.               ~%~%int8 ON        =  1~%int8 OFF       =  0~%int8 NO_CHANGE = -2~%int8 REPEAT    = -1~%int8 FOREVER   = -1~%~%int8 switch_mode~%int32 num_cycles~%float32[] pulse_pattern~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimedSwitch)))
  "Returns full string definition for message of type 'TimedSwitch"
  (cl:format cl:nil "# TimedSwitch allows sender to:~%#    o turn a switch on,~%#    o turn a switch off, and~%#    o repeat an on/off pattern forever or for a~%#          given number of times.~%# Fields (refer to definitions of constants in the definition body):~%#     o switch_mode:~%#         ON: turn on  (num_cycles and pulse_pattern fields are ignored)~%#        OFF: turn off (num_cycles and pulse_pattern fields are ignored)~%#  NO_CHANGE: leave LED in its current state~%#     REPEAT: repeat an on/off pattern for as long~%#             as is indicated in the num_cycles field. The~%#             pattern is defined in the pulse_pattern field.~%#~%#     o num_cycles:~%#          n>=0: run the pattern that is defined in pulse_pattern~%#                n times.~%#          n==FOREVER: run the pattern that is defined in pulse_pattern~%#                       until a new TimedSwitch message is sent.              ~%#~%#     o pulse_pattern:~%#          A series of time durations in fractions of a second. The~%#          first number is the duration for having the switch on.~%#          The second number is the duration for which the switch~%#          is off. The third is an 'on' period again, etc.~%#          A pattern is terminated with the end of the array.~%#           ~%#          Example: [1,1] specifies an on-off sequence of 1 second.               ~%~%int8 ON        =  1~%int8 OFF       =  0~%int8 NO_CHANGE = -2~%int8 REPEAT    = -1~%int8 FOREVER   = -1~%~%int8 switch_mode~%int32 num_cycles~%float32[] pulse_pattern~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimedSwitch>))
  (cl:+ 0
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pulse_pattern) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimedSwitch>))
  "Converts a ROS message object to a list"
  (cl:list 'TimedSwitch
    (cl:cons ':switch_mode (switch_mode msg))
    (cl:cons ':num_cycles (num_cycles msg))
    (cl:cons ':pulse_pattern (pulse_pattern msg))
))
