;; Auto-generated. Do not edit!


(when (boundp 'urg_node::Status)
  (if (not (find-package "URG_NODE"))
    (make-package "URG_NODE"))
  (shadow 'Status (find-package "URG_NODE")))
(unless (find-package "URG_NODE::STATUS")
  (make-package "URG_NODE::STATUS"))

(in-package "ROS")
;;//! \htmlinclude Status.msg.html


(intern "*NORMAL*" (find-package "URG_NODE::STATUS"))
(shadow '*NORMAL* (find-package "URG_NODE::STATUS"))
(defconstant urg_node::Status::*NORMAL* 0)
(intern "*SETTING*" (find-package "URG_NODE::STATUS"))
(shadow '*SETTING* (find-package "URG_NODE::STATUS"))
(defconstant urg_node::Status::*SETTING* 1)

(defun urg_node::Status-to-symbol (const)
  (cond
        ((= const 0) 'urg_node::Status::*NORMAL*)
        ((= const 1) 'urg_node::Status::*SETTING*)
        (t nil)))

(defclass urg_node::Status
  :super ros::object
  :slots (_operating_mode _area_number _error_status _error_code _lockout_status _distance _angle ))

(defmethod urg_node::Status
  (:init
   (&key
    ((:operating_mode __operating_mode) 0)
    ((:area_number __area_number) 0)
    ((:error_status __error_status) nil)
    ((:error_code __error_code) 0)
    ((:lockout_status __lockout_status) nil)
    ((:distance __distance) 0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _operating_mode (round __operating_mode))
   (setq _area_number (round __area_number))
   (setq _error_status __error_status)
   (setq _error_code (round __error_code))
   (setq _lockout_status __lockout_status)
   (setq _distance (round __distance))
   (setq _angle (float __angle))
   self)
  (:operating_mode
   (&optional __operating_mode)
   (if __operating_mode (setq _operating_mode __operating_mode)) _operating_mode)
  (:area_number
   (&optional __area_number)
   (if __area_number (setq _area_number __area_number)) _area_number)
  (:error_status
   (&optional (__error_status :null))
   (if (not (eq __error_status :null)) (setq _error_status __error_status)) _error_status)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:lockout_status
   (&optional (__lockout_status :null))
   (if (not (eq __lockout_status :null)) (setq _lockout_status __lockout_status)) _lockout_status)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; uint16 _operating_mode
    2
    ;; uint16 _area_number
    2
    ;; bool _error_status
    1
    ;; uint16 _error_code
    2
    ;; bool _lockout_status
    1
    ;; uint16 _distance
    2
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _operating_mode
       (write-word _operating_mode s)
     ;; uint16 _area_number
       (write-word _area_number s)
     ;; bool _error_status
       (if _error_status (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _error_code
       (write-word _error_code s)
     ;; bool _lockout_status
       (if _lockout_status (write-byte -1 s) (write-byte 0 s))
     ;; uint16 _distance
       (write-word _distance s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _operating_mode
     (setq _operating_mode (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _area_number
     (setq _area_number (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _error_status
     (setq _error_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _error_code
     (setq _error_code (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _lockout_status
     (setq _lockout_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint16 _distance
     (setq _distance (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get urg_node::Status :md5sum-) "b393072b65230b373302bfe803e80784")
(setf (get urg_node::Status :datatype-) "urg_node/Status")
(setf (get urg_node::Status :definition-)
      "# Normal vs setting in the UAM manual.
uint16 NORMAL=0
uint16 SETTING=1
uint16 operating_mode

# The configured area number the stop occurred in.
uint16 area_number
# If the laser is reporting an error or not.
bool error_status
# The error code the laser is reporting.
uint16 error_code
# Does the laser report that it is locked out.
bool lockout_status
# Distance in mm the stop was reported at.
uint16 distance
# The reported angle of the stop in deg.
float32 angle

")



(provide :urg_node/Status "b393072b65230b373302bfe803e80784")


