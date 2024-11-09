; Auto-generated. Do not edit!


(cl:in-package wiimote-msg)


;//! \htmlinclude State.msg.html

(cl:defclass <State> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (angular_velocity_zeroed
    :reader angular_velocity_zeroed
    :initarg :angular_velocity_zeroed
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (angular_velocity_raw
    :reader angular_velocity_raw
    :initarg :angular_velocity_raw
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (angular_velocity_covariance
    :reader angular_velocity_covariance
    :initarg :angular_velocity_covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0))
   (linear_acceleration_zeroed
    :reader linear_acceleration_zeroed
    :initarg :linear_acceleration_zeroed
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (linear_acceleration_raw
    :reader linear_acceleration_raw
    :initarg :linear_acceleration_raw
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (linear_acceleration_covariance
    :reader linear_acceleration_covariance
    :initarg :linear_acceleration_covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0))
   (nunchuk_acceleration_zeroed
    :reader nunchuk_acceleration_zeroed
    :initarg :nunchuk_acceleration_zeroed
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (nunchuk_acceleration_raw
    :reader nunchuk_acceleration_raw
    :initarg :nunchuk_acceleration_raw
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (nunchuk_joystick_zeroed
    :reader nunchuk_joystick_zeroed
    :initarg :nunchuk_joystick_zeroed
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (nunchuk_joystick_raw
    :reader nunchuk_joystick_raw
    :initarg :nunchuk_joystick_raw
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (buttons
    :reader buttons
    :initarg :buttons
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 11 :element-type 'cl:boolean :initial-element cl:nil))
   (nunchuk_buttons
    :reader nunchuk_buttons
    :initarg :nunchuk_buttons
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 2 :element-type 'cl:boolean :initial-element cl:nil))
   (LEDs
    :reader LEDs
    :initarg :LEDs
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 4 :element-type 'cl:boolean :initial-element cl:nil))
   (rumble
    :reader rumble
    :initarg :rumble
    :type cl:boolean
    :initform cl:nil)
   (ir_tracking
    :reader ir_tracking
    :initarg :ir_tracking
    :type (cl:vector wiimote-msg:IrSourceInfo)
   :initform (cl:make-array 0 :element-type 'wiimote-msg:IrSourceInfo :initial-element (cl:make-instance 'wiimote-msg:IrSourceInfo)))
   (raw_battery
    :reader raw_battery
    :initarg :raw_battery
    :type cl:float
    :initform 0.0)
   (percent_battery
    :reader percent_battery
    :initarg :percent_battery
    :type cl:float
    :initform 0.0)
   (zeroing_time
    :reader zeroing_time
    :initarg :zeroing_time
    :type cl:real
    :initform 0)
   (errors
    :reader errors
    :initarg :errors
    :type cl:integer
    :initform 0))
)

(cl:defclass State (<State>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <State>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'State)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wiimote-msg:<State> is deprecated: use wiimote-msg:State instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:header-val is deprecated.  Use wiimote-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'angular_velocity_zeroed-val :lambda-list '(m))
(cl:defmethod angular_velocity_zeroed-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:angular_velocity_zeroed-val is deprecated.  Use wiimote-msg:angular_velocity_zeroed instead.")
  (angular_velocity_zeroed m))

(cl:ensure-generic-function 'angular_velocity_raw-val :lambda-list '(m))
(cl:defmethod angular_velocity_raw-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:angular_velocity_raw-val is deprecated.  Use wiimote-msg:angular_velocity_raw instead.")
  (angular_velocity_raw m))

(cl:ensure-generic-function 'angular_velocity_covariance-val :lambda-list '(m))
(cl:defmethod angular_velocity_covariance-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:angular_velocity_covariance-val is deprecated.  Use wiimote-msg:angular_velocity_covariance instead.")
  (angular_velocity_covariance m))

(cl:ensure-generic-function 'linear_acceleration_zeroed-val :lambda-list '(m))
(cl:defmethod linear_acceleration_zeroed-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:linear_acceleration_zeroed-val is deprecated.  Use wiimote-msg:linear_acceleration_zeroed instead.")
  (linear_acceleration_zeroed m))

(cl:ensure-generic-function 'linear_acceleration_raw-val :lambda-list '(m))
(cl:defmethod linear_acceleration_raw-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:linear_acceleration_raw-val is deprecated.  Use wiimote-msg:linear_acceleration_raw instead.")
  (linear_acceleration_raw m))

(cl:ensure-generic-function 'linear_acceleration_covariance-val :lambda-list '(m))
(cl:defmethod linear_acceleration_covariance-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:linear_acceleration_covariance-val is deprecated.  Use wiimote-msg:linear_acceleration_covariance instead.")
  (linear_acceleration_covariance m))

(cl:ensure-generic-function 'nunchuk_acceleration_zeroed-val :lambda-list '(m))
(cl:defmethod nunchuk_acceleration_zeroed-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:nunchuk_acceleration_zeroed-val is deprecated.  Use wiimote-msg:nunchuk_acceleration_zeroed instead.")
  (nunchuk_acceleration_zeroed m))

(cl:ensure-generic-function 'nunchuk_acceleration_raw-val :lambda-list '(m))
(cl:defmethod nunchuk_acceleration_raw-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:nunchuk_acceleration_raw-val is deprecated.  Use wiimote-msg:nunchuk_acceleration_raw instead.")
  (nunchuk_acceleration_raw m))

(cl:ensure-generic-function 'nunchuk_joystick_zeroed-val :lambda-list '(m))
(cl:defmethod nunchuk_joystick_zeroed-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:nunchuk_joystick_zeroed-val is deprecated.  Use wiimote-msg:nunchuk_joystick_zeroed instead.")
  (nunchuk_joystick_zeroed m))

(cl:ensure-generic-function 'nunchuk_joystick_raw-val :lambda-list '(m))
(cl:defmethod nunchuk_joystick_raw-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:nunchuk_joystick_raw-val is deprecated.  Use wiimote-msg:nunchuk_joystick_raw instead.")
  (nunchuk_joystick_raw m))

(cl:ensure-generic-function 'buttons-val :lambda-list '(m))
(cl:defmethod buttons-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:buttons-val is deprecated.  Use wiimote-msg:buttons instead.")
  (buttons m))

(cl:ensure-generic-function 'nunchuk_buttons-val :lambda-list '(m))
(cl:defmethod nunchuk_buttons-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:nunchuk_buttons-val is deprecated.  Use wiimote-msg:nunchuk_buttons instead.")
  (nunchuk_buttons m))

(cl:ensure-generic-function 'LEDs-val :lambda-list '(m))
(cl:defmethod LEDs-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:LEDs-val is deprecated.  Use wiimote-msg:LEDs instead.")
  (LEDs m))

(cl:ensure-generic-function 'rumble-val :lambda-list '(m))
(cl:defmethod rumble-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:rumble-val is deprecated.  Use wiimote-msg:rumble instead.")
  (rumble m))

(cl:ensure-generic-function 'ir_tracking-val :lambda-list '(m))
(cl:defmethod ir_tracking-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:ir_tracking-val is deprecated.  Use wiimote-msg:ir_tracking instead.")
  (ir_tracking m))

(cl:ensure-generic-function 'raw_battery-val :lambda-list '(m))
(cl:defmethod raw_battery-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:raw_battery-val is deprecated.  Use wiimote-msg:raw_battery instead.")
  (raw_battery m))

(cl:ensure-generic-function 'percent_battery-val :lambda-list '(m))
(cl:defmethod percent_battery-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:percent_battery-val is deprecated.  Use wiimote-msg:percent_battery instead.")
  (percent_battery m))

(cl:ensure-generic-function 'zeroing_time-val :lambda-list '(m))
(cl:defmethod zeroing_time-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:zeroing_time-val is deprecated.  Use wiimote-msg:zeroing_time instead.")
  (zeroing_time m))

(cl:ensure-generic-function 'errors-val :lambda-list '(m))
(cl:defmethod errors-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wiimote-msg:errors-val is deprecated.  Use wiimote-msg:errors instead.")
  (errors m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<State>)))
    "Constants for message type '<State>"
  '((:INVALID . -1)
    (:INVALID_FLOAT . -1.0)
    (:MSG_BTN_1 . 0)
    (:MSG_BTN_2 . 1)
    (:MSG_BTN_A . 2)
    (:MSG_BTN_B . 3)
    (:MSG_BTN_PLUS . 4)
    (:MSG_BTN_MINUS . 5)
    (:MSG_BTN_LEFT . 6)
    (:MSG_BTN_RIGHT . 7)
    (:MSG_BTN_UP . 8)
    (:MSG_BTN_DOWN . 9)
    (:MSG_BTN_HOME . 10)
    (:MSG_BTN_Z . 0)
    (:MSG_BTN_C . 1)
    (:MSG_CLASSIC_BTN_X . 0)
    (:MSG_CLASSIC_BTN_Y . 1)
    (:MSG_CLASSIC_BTN_A . 2)
    (:MSG_CLASSIC_BTN_B . 3)
    (:MSG_CLASSIC_BTN_PLUS . 4)
    (:MSG_CLASSIC_BTN_MINUS . 5)
    (:MSG_CLASSIC_BTN_LEFT . 6)
    (:MSG_CLASSIC_BTN_RIGHT . 7)
    (:MSG_CLASSIC_BTN_UP . 8)
    (:MSG_CLASSIC_BTN_DOWN . 9)
    (:MSG_CLASSIC_BTN_HOME . 10)
    (:MSG_CLASSIC_BTN_L . 11)
    (:MSG_CLASSIC_BTN_R . 12)
    (:MSG_CLASSIC_BTN_ZL . 13)
    (:MSG_CLASSIC_BTN_ZR . 14))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'State)))
    "Constants for message type 'State"
  '((:INVALID . -1)
    (:INVALID_FLOAT . -1.0)
    (:MSG_BTN_1 . 0)
    (:MSG_BTN_2 . 1)
    (:MSG_BTN_A . 2)
    (:MSG_BTN_B . 3)
    (:MSG_BTN_PLUS . 4)
    (:MSG_BTN_MINUS . 5)
    (:MSG_BTN_LEFT . 6)
    (:MSG_BTN_RIGHT . 7)
    (:MSG_BTN_UP . 8)
    (:MSG_BTN_DOWN . 9)
    (:MSG_BTN_HOME . 10)
    (:MSG_BTN_Z . 0)
    (:MSG_BTN_C . 1)
    (:MSG_CLASSIC_BTN_X . 0)
    (:MSG_CLASSIC_BTN_Y . 1)
    (:MSG_CLASSIC_BTN_A . 2)
    (:MSG_CLASSIC_BTN_B . 3)
    (:MSG_CLASSIC_BTN_PLUS . 4)
    (:MSG_CLASSIC_BTN_MINUS . 5)
    (:MSG_CLASSIC_BTN_LEFT . 6)
    (:MSG_CLASSIC_BTN_RIGHT . 7)
    (:MSG_CLASSIC_BTN_UP . 8)
    (:MSG_CLASSIC_BTN_DOWN . 9)
    (:MSG_CLASSIC_BTN_HOME . 10)
    (:MSG_CLASSIC_BTN_L . 11)
    (:MSG_CLASSIC_BTN_R . 12)
    (:MSG_CLASSIC_BTN_ZL . 13)
    (:MSG_CLASSIC_BTN_ZR . 14))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <State>) ostream)
  "Serializes a message object of type '<State>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular_velocity_zeroed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular_velocity_raw) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'angular_velocity_covariance))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration_zeroed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear_acceleration_raw) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'linear_acceleration_covariance))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nunchuk_acceleration_zeroed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'nunchuk_acceleration_raw) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'nunchuk_joystick_zeroed))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'nunchuk_joystick_raw))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'buttons))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'nunchuk_buttons))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'LEDs))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rumble) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ir_tracking))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ir_tracking))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'raw_battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'percent_battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'zeroing_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'zeroing_time) (cl:floor (cl:slot-value msg 'zeroing_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'errors)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'errors)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <State>) istream)
  "Deserializes a message object of type '<State>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular_velocity_zeroed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular_velocity_raw) istream)
  (cl:setf (cl:slot-value msg 'angular_velocity_covariance) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'angular_velocity_covariance)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration_zeroed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear_acceleration_raw) istream)
  (cl:setf (cl:slot-value msg 'linear_acceleration_covariance) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'linear_acceleration_covariance)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nunchuk_acceleration_zeroed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'nunchuk_acceleration_raw) istream)
  (cl:setf (cl:slot-value msg 'nunchuk_joystick_zeroed) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'nunchuk_joystick_zeroed)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'nunchuk_joystick_raw) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'nunchuk_joystick_raw)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'buttons) (cl:make-array 11))
  (cl:let ((vals (cl:slot-value msg 'buttons)))
    (cl:dotimes (i 11)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  (cl:setf (cl:slot-value msg 'nunchuk_buttons) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'nunchuk_buttons)))
    (cl:dotimes (i 2)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  (cl:setf (cl:slot-value msg 'LEDs) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'LEDs)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
    (cl:setf (cl:slot-value msg 'rumble) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ir_tracking) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ir_tracking)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'wiimote-msg:IrSourceInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'raw_battery) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'percent_battery) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'zeroing_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'errors)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'errors)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<State>)))
  "Returns string type for a message object of type '<State>"
  "wiimote/State")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'State)))
  "Returns string type for a message object of type 'State"
  "wiimote/State")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<State>)))
  "Returns md5sum for a message object of type '<State>"
  "a69651e8129655c6ed3c5039e468362c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'State)))
  "Returns md5sum for a message object of type 'State"
  "a69651e8129655c6ed3c5039e468362c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<State>)))
  "Returns full string definition for message of type '<State>"
  (cl:format cl:nil "#~%#          Wiimote State message containing one complete Wiimote state~%~%# Note: For ease of manipulation this message often uses~%#       int8[] when a bit vector would work. One might~%#       wish to use uint8[], but then Python takes~%#       the respective structure as a string and disallows~%#       item assignment.~%~%int8    INVALID       = -1~%float32 INVALID_FLOAT = -1.0~%~%int8 MSG_BTN_1     = 0~%int8 MSG_BTN_2     = 1~%int8 MSG_BTN_A     = 2~%int8 MSG_BTN_B     = 3~%int8 MSG_BTN_PLUS  = 4~%int8 MSG_BTN_MINUS = 5~%int8 MSG_BTN_LEFT  = 6~%int8 MSG_BTN_RIGHT = 7~%int8 MSG_BTN_UP    = 8~%int8 MSG_BTN_DOWN  = 9~%int8 MSG_BTN_HOME  = 10~%int8 MSG_BTN_Z     = 0~%int8 MSG_BTN_C     = 1~%int8 MSG_CLASSIC_BTN_X       = 0~%int8 MSG_CLASSIC_BTN_Y       = 1~%int8 MSG_CLASSIC_BTN_A       = 2~%int8 MSG_CLASSIC_BTN_B       = 3~%int8 MSG_CLASSIC_BTN_PLUS    = 4~%int8 MSG_CLASSIC_BTN_MINUS   = 5~%int8 MSG_CLASSIC_BTN_LEFT    = 6~%int8 MSG_CLASSIC_BTN_RIGHT   = 7~%int8 MSG_CLASSIC_BTN_UP      = 8~%int8 MSG_CLASSIC_BTN_DOWN    = 9~%int8 MSG_CLASSIC_BTN_HOME    = 10~%int8 MSG_CLASSIC_BTN_L       = 11~%int8 MSG_CLASSIC_BTN_R       = 12~%int8 MSG_CLASSIC_BTN_ZL      = 13~%int8 MSG_CLASSIC_BTN_ZR      = 14~%~%#-----------------------------~%# Header~%#----------------------~%~%Header header~%~%#----------------------~%# Gyro reading~%#-----------------------------~%# In radians/sec. If reading is invalid,~%# for instance b/c no gyro is attached to the Wii, then~%# set first element of covariance to -1 (same as imu_data.msg):~%# Covariance matrix (roll, pitch, yaw) in radians^2/sec^2.~%~%geometry_msgs/Vector3 angular_velocity_zeroed~%geometry_msgs/Vector3 angular_velocity_raw~%float64[9] angular_velocity_covariance~%~%#----------------------~%# Accelerometer reading~%#-----------------------------~%# Acceleration in m/sec^2. Covariance matrix~%# (x,y,z) in m^2/sec^4.  (all same as imu_data.msg)~%~%geometry_msgs/Vector3 linear_acceleration_zeroed~%geometry_msgs/Vector3 linear_acceleration_raw~%float64[9] linear_acceleration_covariance~%~%#------------------------------~%# Nunchuk Accelerometer reading~%#------------------------------~%geometry_msgs/Vector3 nunchuk_acceleration_zeroed~%geometry_msgs/Vector3 nunchuk_acceleration_raw~%~%#-----------------~%# Nunchuk Joystick~%#-----------------~%float32[2] nunchuk_joystick_zeroed~%float32[2] nunchuk_joystick_raw~%~%#----------------------~%# Wiimote buttons~%#-----------------------------~%# Mappings from Wiimote button name~%# to array position are defined above.~%#~%bool[11] buttons~%bool[2] nunchuk_buttons~%~%#----------------------~%# Wiimote LED states:~%#-----------------------------~%~%bool[4] LEDs~%~%#----------------------~%# Wiimote Rumble~%#-----------------------------~%# State (True or False)~%~%bool rumble~%~%#----------------------~%# IR Light sensor (Camera)~%#-----------------------------~%# The Wiimote handles up to four light sources, ~%# and the wiimote_node.py software is written to ~%# that limit as well. For future expansion~%# we make the following array extensible, rather~%# than locking its length down to four:~%~%wiimote/IrSourceInfo[] ir_tracking~%~%#----------------------~%# Wiimote battery~%#-----------------------------~%# A battery reading consists of two numbers: ~%# the battery percentage, and the raw reading.~%# Maximum battery is 208 units (unknown how this~%# relates to electrical properties): ~%~%float32 raw_battery~%float32 percent_battery~%~%#----------------------~%# Time of most recent zeroing:~%#-----------------------------~%~%time zeroing_time~%~%#----------------------~%# Error vector~%#-----------------------------~%# For error condition definitions see wiimoteConstants.py~%# Value of zero means all is well. (Currently NOT used).~%~%uint64 errors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: wiimote/IrSourceInfo~%# Sensor data pertaining to the Wiimote infrared camera.~%# This message contains data for one of the four infrared ~%# light sources that the camera detects.~%#~%# Each light is specified with a 2D position and ~%# a 'source magnitude' (ir_size). If the x dimension~%# is set to INVALID_FLOAT, then no light was detected for ~%# the respective light. The Wiimote handles up to~%# four light sources, and the wiimote_node.py software~%# is written to that limit as well.~%#~%# I am unsure what the 'ir_size' values represent. ~%# They are described as 'source magnitude' in some places. I~%# *assume* this is signal amplitude, but it's unclear. ~%# Note that current lowest level cwiid driver does not ~%# seem to pass the ir_size value to the cwiid Wiimote.c. ~%# For now this size will therefore be set INVALID~%~%float64 x ~%float64 y ~%int64 ir_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'State)))
  "Returns full string definition for message of type 'State"
  (cl:format cl:nil "#~%#          Wiimote State message containing one complete Wiimote state~%~%# Note: For ease of manipulation this message often uses~%#       int8[] when a bit vector would work. One might~%#       wish to use uint8[], but then Python takes~%#       the respective structure as a string and disallows~%#       item assignment.~%~%int8    INVALID       = -1~%float32 INVALID_FLOAT = -1.0~%~%int8 MSG_BTN_1     = 0~%int8 MSG_BTN_2     = 1~%int8 MSG_BTN_A     = 2~%int8 MSG_BTN_B     = 3~%int8 MSG_BTN_PLUS  = 4~%int8 MSG_BTN_MINUS = 5~%int8 MSG_BTN_LEFT  = 6~%int8 MSG_BTN_RIGHT = 7~%int8 MSG_BTN_UP    = 8~%int8 MSG_BTN_DOWN  = 9~%int8 MSG_BTN_HOME  = 10~%int8 MSG_BTN_Z     = 0~%int8 MSG_BTN_C     = 1~%int8 MSG_CLASSIC_BTN_X       = 0~%int8 MSG_CLASSIC_BTN_Y       = 1~%int8 MSG_CLASSIC_BTN_A       = 2~%int8 MSG_CLASSIC_BTN_B       = 3~%int8 MSG_CLASSIC_BTN_PLUS    = 4~%int8 MSG_CLASSIC_BTN_MINUS   = 5~%int8 MSG_CLASSIC_BTN_LEFT    = 6~%int8 MSG_CLASSIC_BTN_RIGHT   = 7~%int8 MSG_CLASSIC_BTN_UP      = 8~%int8 MSG_CLASSIC_BTN_DOWN    = 9~%int8 MSG_CLASSIC_BTN_HOME    = 10~%int8 MSG_CLASSIC_BTN_L       = 11~%int8 MSG_CLASSIC_BTN_R       = 12~%int8 MSG_CLASSIC_BTN_ZL      = 13~%int8 MSG_CLASSIC_BTN_ZR      = 14~%~%#-----------------------------~%# Header~%#----------------------~%~%Header header~%~%#----------------------~%# Gyro reading~%#-----------------------------~%# In radians/sec. If reading is invalid,~%# for instance b/c no gyro is attached to the Wii, then~%# set first element of covariance to -1 (same as imu_data.msg):~%# Covariance matrix (roll, pitch, yaw) in radians^2/sec^2.~%~%geometry_msgs/Vector3 angular_velocity_zeroed~%geometry_msgs/Vector3 angular_velocity_raw~%float64[9] angular_velocity_covariance~%~%#----------------------~%# Accelerometer reading~%#-----------------------------~%# Acceleration in m/sec^2. Covariance matrix~%# (x,y,z) in m^2/sec^4.  (all same as imu_data.msg)~%~%geometry_msgs/Vector3 linear_acceleration_zeroed~%geometry_msgs/Vector3 linear_acceleration_raw~%float64[9] linear_acceleration_covariance~%~%#------------------------------~%# Nunchuk Accelerometer reading~%#------------------------------~%geometry_msgs/Vector3 nunchuk_acceleration_zeroed~%geometry_msgs/Vector3 nunchuk_acceleration_raw~%~%#-----------------~%# Nunchuk Joystick~%#-----------------~%float32[2] nunchuk_joystick_zeroed~%float32[2] nunchuk_joystick_raw~%~%#----------------------~%# Wiimote buttons~%#-----------------------------~%# Mappings from Wiimote button name~%# to array position are defined above.~%#~%bool[11] buttons~%bool[2] nunchuk_buttons~%~%#----------------------~%# Wiimote LED states:~%#-----------------------------~%~%bool[4] LEDs~%~%#----------------------~%# Wiimote Rumble~%#-----------------------------~%# State (True or False)~%~%bool rumble~%~%#----------------------~%# IR Light sensor (Camera)~%#-----------------------------~%# The Wiimote handles up to four light sources, ~%# and the wiimote_node.py software is written to ~%# that limit as well. For future expansion~%# we make the following array extensible, rather~%# than locking its length down to four:~%~%wiimote/IrSourceInfo[] ir_tracking~%~%#----------------------~%# Wiimote battery~%#-----------------------------~%# A battery reading consists of two numbers: ~%# the battery percentage, and the raw reading.~%# Maximum battery is 208 units (unknown how this~%# relates to electrical properties): ~%~%float32 raw_battery~%float32 percent_battery~%~%#----------------------~%# Time of most recent zeroing:~%#-----------------------------~%~%time zeroing_time~%~%#----------------------~%# Error vector~%#-----------------------------~%# For error condition definitions see wiimoteConstants.py~%# Value of zero means all is well. (Currently NOT used).~%~%uint64 errors~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: wiimote/IrSourceInfo~%# Sensor data pertaining to the Wiimote infrared camera.~%# This message contains data for one of the four infrared ~%# light sources that the camera detects.~%#~%# Each light is specified with a 2D position and ~%# a 'source magnitude' (ir_size). If the x dimension~%# is set to INVALID_FLOAT, then no light was detected for ~%# the respective light. The Wiimote handles up to~%# four light sources, and the wiimote_node.py software~%# is written to that limit as well.~%#~%# I am unsure what the 'ir_size' values represent. ~%# They are described as 'source magnitude' in some places. I~%# *assume* this is signal amplitude, but it's unclear. ~%# Note that current lowest level cwiid driver does not ~%# seem to pass the ir_size value to the cwiid Wiimote.c. ~%# For now this size will therefore be set INVALID~%~%float64 x ~%float64 y ~%int64 ir_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <State>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular_velocity_zeroed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular_velocity_raw))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'angular_velocity_covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration_zeroed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear_acceleration_raw))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'linear_acceleration_covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nunchuk_acceleration_zeroed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'nunchuk_acceleration_raw))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'nunchuk_joystick_zeroed) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'nunchuk_joystick_raw) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'buttons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'nunchuk_buttons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'LEDs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ir_tracking) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <State>))
  "Converts a ROS message object to a list"
  (cl:list 'State
    (cl:cons ':header (header msg))
    (cl:cons ':angular_velocity_zeroed (angular_velocity_zeroed msg))
    (cl:cons ':angular_velocity_raw (angular_velocity_raw msg))
    (cl:cons ':angular_velocity_covariance (angular_velocity_covariance msg))
    (cl:cons ':linear_acceleration_zeroed (linear_acceleration_zeroed msg))
    (cl:cons ':linear_acceleration_raw (linear_acceleration_raw msg))
    (cl:cons ':linear_acceleration_covariance (linear_acceleration_covariance msg))
    (cl:cons ':nunchuk_acceleration_zeroed (nunchuk_acceleration_zeroed msg))
    (cl:cons ':nunchuk_acceleration_raw (nunchuk_acceleration_raw msg))
    (cl:cons ':nunchuk_joystick_zeroed (nunchuk_joystick_zeroed msg))
    (cl:cons ':nunchuk_joystick_raw (nunchuk_joystick_raw msg))
    (cl:cons ':buttons (buttons msg))
    (cl:cons ':nunchuk_buttons (nunchuk_buttons msg))
    (cl:cons ':LEDs (LEDs msg))
    (cl:cons ':rumble (rumble msg))
    (cl:cons ':ir_tracking (ir_tracking msg))
    (cl:cons ':raw_battery (raw_battery msg))
    (cl:cons ':percent_battery (percent_battery msg))
    (cl:cons ':zeroing_time (zeroing_time msg))
    (cl:cons ':errors (errors msg))
))
