;; Auto-generated. Do not edit!


(when (boundp 'ch104m::Imu_0x91_msg)
  (if (not (find-package "CH104M"))
    (make-package "CH104M"))
  (shadow 'Imu_0x91_msg (find-package "CH104M")))
(unless (find-package "CH104M::IMU_0X91_MSG")
  (make-package "CH104M::IMU_0X91_MSG"))

(in-package "ROS")
;;//! \htmlinclude Imu_0x91_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ch104m::Imu_0x91_msg
  :super ros::object
  :slots (_header _imu_data ))

(defmethod ch104m::Imu_0x91_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:imu_data __imu_data) (instance ch104m::Imu_data_package :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _imu_data __imu_data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:imu_data
   (&rest __imu_data)
   (if (keywordp (car __imu_data))
       (send* _imu_data __imu_data)
     (progn
       (if __imu_data (setq _imu_data (car __imu_data)))
       _imu_data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ch104m/Imu_data_package _imu_data
    (send _imu_data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ch104m/Imu_data_package _imu_data
       (send _imu_data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ch104m/Imu_data_package _imu_data
     (send _imu_data :deserialize buf ptr-) (incf ptr- (send _imu_data :serialization-length))
   ;;
   self)
  )

(setf (get ch104m::Imu_0x91_msg :md5sum-) "bf1a29bdfa7a4861f3dcfb7c14758970")
(setf (get ch104m::Imu_0x91_msg :datatype-) "ch104m/Imu_0x91_msg")
(setf (get ch104m::Imu_0x91_msg :definition-)
      "#90 91 data_package
Header header
Imu_data_package imu_data


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ch104m/Imu_data_package
uint8 tag
uint8 bitmap
uint8 id
float32 prs
uint32 time
uint32 frame_rate
float32 acc_x
float32 acc_y
float32 acc_z
float32 gyr_x
float32 gyr_y
float32 gyr_z
float32 mag_x
float32 mag_y
float32 mag_z
float32 eul_r
float32 eul_p
float32 eul_y
float32 quat_w
float32 quat_x
float32 quat_y
float32 quat_z

")



(provide :ch104m/Imu_0x91_msg "bf1a29bdfa7a4861f3dcfb7c14758970")


