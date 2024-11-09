; Auto-generated. Do not edit!


(cl:in-package ch104m-msg)


;//! \htmlinclude Imu_data_package.msg.html

(cl:defclass <Imu_data_package> (roslisp-msg-protocol:ros-message)
  ((tag
    :reader tag
    :initarg :tag
    :type cl:fixnum
    :initform 0)
   (bitmap
    :reader bitmap
    :initarg :bitmap
    :type cl:fixnum
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (prs
    :reader prs
    :initarg :prs
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:integer
    :initform 0)
   (frame_rate
    :reader frame_rate
    :initarg :frame_rate
    :type cl:integer
    :initform 0)
   (acc_x
    :reader acc_x
    :initarg :acc_x
    :type cl:float
    :initform 0.0)
   (acc_y
    :reader acc_y
    :initarg :acc_y
    :type cl:float
    :initform 0.0)
   (acc_z
    :reader acc_z
    :initarg :acc_z
    :type cl:float
    :initform 0.0)
   (gyr_x
    :reader gyr_x
    :initarg :gyr_x
    :type cl:float
    :initform 0.0)
   (gyr_y
    :reader gyr_y
    :initarg :gyr_y
    :type cl:float
    :initform 0.0)
   (gyr_z
    :reader gyr_z
    :initarg :gyr_z
    :type cl:float
    :initform 0.0)
   (mag_x
    :reader mag_x
    :initarg :mag_x
    :type cl:float
    :initform 0.0)
   (mag_y
    :reader mag_y
    :initarg :mag_y
    :type cl:float
    :initform 0.0)
   (mag_z
    :reader mag_z
    :initarg :mag_z
    :type cl:float
    :initform 0.0)
   (eul_r
    :reader eul_r
    :initarg :eul_r
    :type cl:float
    :initform 0.0)
   (eul_p
    :reader eul_p
    :initarg :eul_p
    :type cl:float
    :initform 0.0)
   (eul_y
    :reader eul_y
    :initarg :eul_y
    :type cl:float
    :initform 0.0)
   (quat_w
    :reader quat_w
    :initarg :quat_w
    :type cl:float
    :initform 0.0)
   (quat_x
    :reader quat_x
    :initarg :quat_x
    :type cl:float
    :initform 0.0)
   (quat_y
    :reader quat_y
    :initarg :quat_y
    :type cl:float
    :initform 0.0)
   (quat_z
    :reader quat_z
    :initarg :quat_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass Imu_data_package (<Imu_data_package>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Imu_data_package>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Imu_data_package)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ch104m-msg:<Imu_data_package> is deprecated: use ch104m-msg:Imu_data_package instead.")))

(cl:ensure-generic-function 'tag-val :lambda-list '(m))
(cl:defmethod tag-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:tag-val is deprecated.  Use ch104m-msg:tag instead.")
  (tag m))

(cl:ensure-generic-function 'bitmap-val :lambda-list '(m))
(cl:defmethod bitmap-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:bitmap-val is deprecated.  Use ch104m-msg:bitmap instead.")
  (bitmap m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:id-val is deprecated.  Use ch104m-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'prs-val :lambda-list '(m))
(cl:defmethod prs-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:prs-val is deprecated.  Use ch104m-msg:prs instead.")
  (prs m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:time-val is deprecated.  Use ch104m-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'frame_rate-val :lambda-list '(m))
(cl:defmethod frame_rate-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:frame_rate-val is deprecated.  Use ch104m-msg:frame_rate instead.")
  (frame_rate m))

(cl:ensure-generic-function 'acc_x-val :lambda-list '(m))
(cl:defmethod acc_x-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:acc_x-val is deprecated.  Use ch104m-msg:acc_x instead.")
  (acc_x m))

(cl:ensure-generic-function 'acc_y-val :lambda-list '(m))
(cl:defmethod acc_y-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:acc_y-val is deprecated.  Use ch104m-msg:acc_y instead.")
  (acc_y m))

(cl:ensure-generic-function 'acc_z-val :lambda-list '(m))
(cl:defmethod acc_z-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:acc_z-val is deprecated.  Use ch104m-msg:acc_z instead.")
  (acc_z m))

(cl:ensure-generic-function 'gyr_x-val :lambda-list '(m))
(cl:defmethod gyr_x-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:gyr_x-val is deprecated.  Use ch104m-msg:gyr_x instead.")
  (gyr_x m))

(cl:ensure-generic-function 'gyr_y-val :lambda-list '(m))
(cl:defmethod gyr_y-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:gyr_y-val is deprecated.  Use ch104m-msg:gyr_y instead.")
  (gyr_y m))

(cl:ensure-generic-function 'gyr_z-val :lambda-list '(m))
(cl:defmethod gyr_z-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:gyr_z-val is deprecated.  Use ch104m-msg:gyr_z instead.")
  (gyr_z m))

(cl:ensure-generic-function 'mag_x-val :lambda-list '(m))
(cl:defmethod mag_x-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:mag_x-val is deprecated.  Use ch104m-msg:mag_x instead.")
  (mag_x m))

(cl:ensure-generic-function 'mag_y-val :lambda-list '(m))
(cl:defmethod mag_y-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:mag_y-val is deprecated.  Use ch104m-msg:mag_y instead.")
  (mag_y m))

(cl:ensure-generic-function 'mag_z-val :lambda-list '(m))
(cl:defmethod mag_z-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:mag_z-val is deprecated.  Use ch104m-msg:mag_z instead.")
  (mag_z m))

(cl:ensure-generic-function 'eul_r-val :lambda-list '(m))
(cl:defmethod eul_r-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:eul_r-val is deprecated.  Use ch104m-msg:eul_r instead.")
  (eul_r m))

(cl:ensure-generic-function 'eul_p-val :lambda-list '(m))
(cl:defmethod eul_p-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:eul_p-val is deprecated.  Use ch104m-msg:eul_p instead.")
  (eul_p m))

(cl:ensure-generic-function 'eul_y-val :lambda-list '(m))
(cl:defmethod eul_y-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:eul_y-val is deprecated.  Use ch104m-msg:eul_y instead.")
  (eul_y m))

(cl:ensure-generic-function 'quat_w-val :lambda-list '(m))
(cl:defmethod quat_w-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:quat_w-val is deprecated.  Use ch104m-msg:quat_w instead.")
  (quat_w m))

(cl:ensure-generic-function 'quat_x-val :lambda-list '(m))
(cl:defmethod quat_x-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:quat_x-val is deprecated.  Use ch104m-msg:quat_x instead.")
  (quat_x m))

(cl:ensure-generic-function 'quat_y-val :lambda-list '(m))
(cl:defmethod quat_y-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:quat_y-val is deprecated.  Use ch104m-msg:quat_y instead.")
  (quat_y m))

(cl:ensure-generic-function 'quat_z-val :lambda-list '(m))
(cl:defmethod quat_z-val ((m <Imu_data_package>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ch104m-msg:quat_z-val is deprecated.  Use ch104m-msg:quat_z instead.")
  (quat_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Imu_data_package>) ostream)
  "Serializes a message object of type '<Imu_data_package>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bitmap)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'prs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame_rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame_rate)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyr_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyr_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyr_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mag_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mag_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mag_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eul_r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eul_p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'eul_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Imu_data_package>) istream)
  "Deserializes a message object of type '<Imu_data_package>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bitmap)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'prs) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'frame_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'frame_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'frame_rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'frame_rate)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyr_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyr_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyr_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mag_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mag_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mag_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eul_r) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eul_p) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'eul_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_w) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Imu_data_package>)))
  "Returns string type for a message object of type '<Imu_data_package>"
  "ch104m/Imu_data_package")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imu_data_package)))
  "Returns string type for a message object of type 'Imu_data_package"
  "ch104m/Imu_data_package")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Imu_data_package>)))
  "Returns md5sum for a message object of type '<Imu_data_package>"
  "282c5be5a2e43c668a2bbf282a34b55a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Imu_data_package)))
  "Returns md5sum for a message object of type 'Imu_data_package"
  "282c5be5a2e43c668a2bbf282a34b55a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Imu_data_package>)))
  "Returns full string definition for message of type '<Imu_data_package>"
  (cl:format cl:nil "uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Imu_data_package)))
  "Returns full string definition for message of type 'Imu_data_package"
  (cl:format cl:nil "uint8 tag~%uint8 bitmap~%uint8 id~%float32 prs~%uint32 time~%uint32 frame_rate~%float32 acc_x~%float32 acc_y~%float32 acc_z~%float32 gyr_x~%float32 gyr_y~%float32 gyr_z~%float32 mag_x~%float32 mag_y~%float32 mag_z~%float32 eul_r~%float32 eul_p~%float32 eul_y~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Imu_data_package>))
  (cl:+ 0
     1
     1
     1
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Imu_data_package>))
  "Converts a ROS message object to a list"
  (cl:list 'Imu_data_package
    (cl:cons ':tag (tag msg))
    (cl:cons ':bitmap (bitmap msg))
    (cl:cons ':id (id msg))
    (cl:cons ':prs (prs msg))
    (cl:cons ':time (time msg))
    (cl:cons ':frame_rate (frame_rate msg))
    (cl:cons ':acc_x (acc_x msg))
    (cl:cons ':acc_y (acc_y msg))
    (cl:cons ':acc_z (acc_z msg))
    (cl:cons ':gyr_x (gyr_x msg))
    (cl:cons ':gyr_y (gyr_y msg))
    (cl:cons ':gyr_z (gyr_z msg))
    (cl:cons ':mag_x (mag_x msg))
    (cl:cons ':mag_y (mag_y msg))
    (cl:cons ':mag_z (mag_z msg))
    (cl:cons ':eul_r (eul_r msg))
    (cl:cons ':eul_p (eul_p msg))
    (cl:cons ':eul_y (eul_y msg))
    (cl:cons ':quat_w (quat_w msg))
    (cl:cons ':quat_x (quat_x msg))
    (cl:cons ':quat_y (quat_y msg))
    (cl:cons ':quat_z (quat_z msg))
))
