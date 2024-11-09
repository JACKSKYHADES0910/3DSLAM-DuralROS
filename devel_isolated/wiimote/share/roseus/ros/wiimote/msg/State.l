;; Auto-generated. Do not edit!


(when (boundp 'wiimote::State)
  (if (not (find-package "WIIMOTE"))
    (make-package "WIIMOTE"))
  (shadow 'State (find-package "WIIMOTE")))
(unless (find-package "WIIMOTE::STATE")
  (make-package "WIIMOTE::STATE"))

(in-package "ROS")
;;//! \htmlinclude State.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*INVALID*" (find-package "WIIMOTE::STATE"))
(shadow '*INVALID* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*INVALID* -1)
(intern "*INVALID_FLOAT*" (find-package "WIIMOTE::STATE"))
(shadow '*INVALID_FLOAT* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*INVALID_FLOAT* -1.0)
(intern "*MSG_BTN_1*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_1* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_1* 0)
(intern "*MSG_BTN_2*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_2* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_2* 1)
(intern "*MSG_BTN_A*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_A* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_A* 2)
(intern "*MSG_BTN_B*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_B* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_B* 3)
(intern "*MSG_BTN_PLUS*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_PLUS* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_PLUS* 4)
(intern "*MSG_BTN_MINUS*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_MINUS* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_MINUS* 5)
(intern "*MSG_BTN_LEFT*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_LEFT* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_LEFT* 6)
(intern "*MSG_BTN_RIGHT*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_RIGHT* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_RIGHT* 7)
(intern "*MSG_BTN_UP*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_UP* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_UP* 8)
(intern "*MSG_BTN_DOWN*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_DOWN* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_DOWN* 9)
(intern "*MSG_BTN_HOME*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_HOME* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_HOME* 10)
(intern "*MSG_BTN_Z*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_Z* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_Z* 0)
(intern "*MSG_BTN_C*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_BTN_C* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_BTN_C* 1)
(intern "*MSG_CLASSIC_BTN_X*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_X* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_X* 0)
(intern "*MSG_CLASSIC_BTN_Y*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_Y* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_Y* 1)
(intern "*MSG_CLASSIC_BTN_A*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_A* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_A* 2)
(intern "*MSG_CLASSIC_BTN_B*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_B* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_B* 3)
(intern "*MSG_CLASSIC_BTN_PLUS*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_PLUS* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_PLUS* 4)
(intern "*MSG_CLASSIC_BTN_MINUS*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_MINUS* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_MINUS* 5)
(intern "*MSG_CLASSIC_BTN_LEFT*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_LEFT* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_LEFT* 6)
(intern "*MSG_CLASSIC_BTN_RIGHT*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_RIGHT* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_RIGHT* 7)
(intern "*MSG_CLASSIC_BTN_UP*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_UP* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_UP* 8)
(intern "*MSG_CLASSIC_BTN_DOWN*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_DOWN* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_DOWN* 9)
(intern "*MSG_CLASSIC_BTN_HOME*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_HOME* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_HOME* 10)
(intern "*MSG_CLASSIC_BTN_L*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_L* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_L* 11)
(intern "*MSG_CLASSIC_BTN_R*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_R* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_R* 12)
(intern "*MSG_CLASSIC_BTN_ZL*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_ZL* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_ZL* 13)
(intern "*MSG_CLASSIC_BTN_ZR*" (find-package "WIIMOTE::STATE"))
(shadow '*MSG_CLASSIC_BTN_ZR* (find-package "WIIMOTE::STATE"))
(defconstant wiimote::State::*MSG_CLASSIC_BTN_ZR* 14)

(defun wiimote::State-to-symbol (const)
  (cond
        ((= const -1) 'wiimote::State::*INVALID*)
        ((= const 0) 'wiimote::State::*MSG_BTN_1*)
        ((= const 1) 'wiimote::State::*MSG_BTN_2*)
        ((= const 2) 'wiimote::State::*MSG_BTN_A*)
        ((= const 3) 'wiimote::State::*MSG_BTN_B*)
        ((= const 4) 'wiimote::State::*MSG_BTN_PLUS*)
        ((= const 5) 'wiimote::State::*MSG_BTN_MINUS*)
        ((= const 6) 'wiimote::State::*MSG_BTN_LEFT*)
        ((= const 7) 'wiimote::State::*MSG_BTN_RIGHT*)
        ((= const 8) 'wiimote::State::*MSG_BTN_UP*)
        ((= const 9) 'wiimote::State::*MSG_BTN_DOWN*)
        ((= const 10) 'wiimote::State::*MSG_BTN_HOME*)
        ((= const 0) 'wiimote::State::*MSG_BTN_Z*)
        ((= const 1) 'wiimote::State::*MSG_BTN_C*)
        ((= const 0) 'wiimote::State::*MSG_CLASSIC_BTN_X*)
        ((= const 1) 'wiimote::State::*MSG_CLASSIC_BTN_Y*)
        ((= const 2) 'wiimote::State::*MSG_CLASSIC_BTN_A*)
        ((= const 3) 'wiimote::State::*MSG_CLASSIC_BTN_B*)
        ((= const 4) 'wiimote::State::*MSG_CLASSIC_BTN_PLUS*)
        ((= const 5) 'wiimote::State::*MSG_CLASSIC_BTN_MINUS*)
        ((= const 6) 'wiimote::State::*MSG_CLASSIC_BTN_LEFT*)
        ((= const 7) 'wiimote::State::*MSG_CLASSIC_BTN_RIGHT*)
        ((= const 8) 'wiimote::State::*MSG_CLASSIC_BTN_UP*)
        ((= const 9) 'wiimote::State::*MSG_CLASSIC_BTN_DOWN*)
        ((= const 10) 'wiimote::State::*MSG_CLASSIC_BTN_HOME*)
        ((= const 11) 'wiimote::State::*MSG_CLASSIC_BTN_L*)
        ((= const 12) 'wiimote::State::*MSG_CLASSIC_BTN_R*)
        ((= const 13) 'wiimote::State::*MSG_CLASSIC_BTN_ZL*)
        ((= const 14) 'wiimote::State::*MSG_CLASSIC_BTN_ZR*)
        (t nil)))

(defclass wiimote::State
  :super ros::object
  :slots (_header _angular_velocity_zeroed _angular_velocity_raw _angular_velocity_covariance _linear_acceleration_zeroed _linear_acceleration_raw _linear_acceleration_covariance _nunchuk_acceleration_zeroed _nunchuk_acceleration_raw _nunchuk_joystick_zeroed _nunchuk_joystick_raw _buttons _nunchuk_buttons _LEDs _rumble _ir_tracking _raw_battery _percent_battery _zeroing_time _errors ))

(defmethod wiimote::State
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:angular_velocity_zeroed __angular_velocity_zeroed) (instance geometry_msgs::Vector3 :init))
    ((:angular_velocity_raw __angular_velocity_raw) (instance geometry_msgs::Vector3 :init))
    ((:angular_velocity_covariance __angular_velocity_covariance) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:linear_acceleration_zeroed __linear_acceleration_zeroed) (instance geometry_msgs::Vector3 :init))
    ((:linear_acceleration_raw __linear_acceleration_raw) (instance geometry_msgs::Vector3 :init))
    ((:linear_acceleration_covariance __linear_acceleration_covariance) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:nunchuk_acceleration_zeroed __nunchuk_acceleration_zeroed) (instance geometry_msgs::Vector3 :init))
    ((:nunchuk_acceleration_raw __nunchuk_acceleration_raw) (instance geometry_msgs::Vector3 :init))
    ((:nunchuk_joystick_zeroed __nunchuk_joystick_zeroed) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:nunchuk_joystick_raw __nunchuk_joystick_raw) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:buttons __buttons) (let (r) (dotimes (i 11) (push nil r)) r))
    ((:nunchuk_buttons __nunchuk_buttons) (let (r) (dotimes (i 2) (push nil r)) r))
    ((:LEDs __LEDs) (let (r) (dotimes (i 4) (push nil r)) r))
    ((:rumble __rumble) nil)
    ((:ir_tracking __ir_tracking) ())
    ((:raw_battery __raw_battery) 0.0)
    ((:percent_battery __percent_battery) 0.0)
    ((:zeroing_time __zeroing_time) (instance ros::time :init))
    ((:errors __errors) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _angular_velocity_zeroed __angular_velocity_zeroed)
   (setq _angular_velocity_raw __angular_velocity_raw)
   (setq _angular_velocity_covariance __angular_velocity_covariance)
   (setq _linear_acceleration_zeroed __linear_acceleration_zeroed)
   (setq _linear_acceleration_raw __linear_acceleration_raw)
   (setq _linear_acceleration_covariance __linear_acceleration_covariance)
   (setq _nunchuk_acceleration_zeroed __nunchuk_acceleration_zeroed)
   (setq _nunchuk_acceleration_raw __nunchuk_acceleration_raw)
   (setq _nunchuk_joystick_zeroed __nunchuk_joystick_zeroed)
   (setq _nunchuk_joystick_raw __nunchuk_joystick_raw)
   (setq _buttons __buttons)
   (setq _nunchuk_buttons __nunchuk_buttons)
   (setq _LEDs __LEDs)
   (setq _rumble __rumble)
   (setq _ir_tracking __ir_tracking)
   (setq _raw_battery (float __raw_battery))
   (setq _percent_battery (float __percent_battery))
   (setq _zeroing_time __zeroing_time)
   (setq _errors (round __errors))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:angular_velocity_zeroed
   (&rest __angular_velocity_zeroed)
   (if (keywordp (car __angular_velocity_zeroed))
       (send* _angular_velocity_zeroed __angular_velocity_zeroed)
     (progn
       (if __angular_velocity_zeroed (setq _angular_velocity_zeroed (car __angular_velocity_zeroed)))
       _angular_velocity_zeroed)))
  (:angular_velocity_raw
   (&rest __angular_velocity_raw)
   (if (keywordp (car __angular_velocity_raw))
       (send* _angular_velocity_raw __angular_velocity_raw)
     (progn
       (if __angular_velocity_raw (setq _angular_velocity_raw (car __angular_velocity_raw)))
       _angular_velocity_raw)))
  (:angular_velocity_covariance
   (&optional __angular_velocity_covariance)
   (if __angular_velocity_covariance (setq _angular_velocity_covariance __angular_velocity_covariance)) _angular_velocity_covariance)
  (:linear_acceleration_zeroed
   (&rest __linear_acceleration_zeroed)
   (if (keywordp (car __linear_acceleration_zeroed))
       (send* _linear_acceleration_zeroed __linear_acceleration_zeroed)
     (progn
       (if __linear_acceleration_zeroed (setq _linear_acceleration_zeroed (car __linear_acceleration_zeroed)))
       _linear_acceleration_zeroed)))
  (:linear_acceleration_raw
   (&rest __linear_acceleration_raw)
   (if (keywordp (car __linear_acceleration_raw))
       (send* _linear_acceleration_raw __linear_acceleration_raw)
     (progn
       (if __linear_acceleration_raw (setq _linear_acceleration_raw (car __linear_acceleration_raw)))
       _linear_acceleration_raw)))
  (:linear_acceleration_covariance
   (&optional __linear_acceleration_covariance)
   (if __linear_acceleration_covariance (setq _linear_acceleration_covariance __linear_acceleration_covariance)) _linear_acceleration_covariance)
  (:nunchuk_acceleration_zeroed
   (&rest __nunchuk_acceleration_zeroed)
   (if (keywordp (car __nunchuk_acceleration_zeroed))
       (send* _nunchuk_acceleration_zeroed __nunchuk_acceleration_zeroed)
     (progn
       (if __nunchuk_acceleration_zeroed (setq _nunchuk_acceleration_zeroed (car __nunchuk_acceleration_zeroed)))
       _nunchuk_acceleration_zeroed)))
  (:nunchuk_acceleration_raw
   (&rest __nunchuk_acceleration_raw)
   (if (keywordp (car __nunchuk_acceleration_raw))
       (send* _nunchuk_acceleration_raw __nunchuk_acceleration_raw)
     (progn
       (if __nunchuk_acceleration_raw (setq _nunchuk_acceleration_raw (car __nunchuk_acceleration_raw)))
       _nunchuk_acceleration_raw)))
  (:nunchuk_joystick_zeroed
   (&optional __nunchuk_joystick_zeroed)
   (if __nunchuk_joystick_zeroed (setq _nunchuk_joystick_zeroed __nunchuk_joystick_zeroed)) _nunchuk_joystick_zeroed)
  (:nunchuk_joystick_raw
   (&optional __nunchuk_joystick_raw)
   (if __nunchuk_joystick_raw (setq _nunchuk_joystick_raw __nunchuk_joystick_raw)) _nunchuk_joystick_raw)
  (:buttons
   (&optional __buttons)
   (if __buttons (setq _buttons __buttons)) _buttons)
  (:nunchuk_buttons
   (&optional __nunchuk_buttons)
   (if __nunchuk_buttons (setq _nunchuk_buttons __nunchuk_buttons)) _nunchuk_buttons)
  (:LEDs
   (&optional __LEDs)
   (if __LEDs (setq _LEDs __LEDs)) _LEDs)
  (:rumble
   (&optional (__rumble :null))
   (if (not (eq __rumble :null)) (setq _rumble __rumble)) _rumble)
  (:ir_tracking
   (&rest __ir_tracking)
   (if (keywordp (car __ir_tracking))
       (send* _ir_tracking __ir_tracking)
     (progn
       (if __ir_tracking (setq _ir_tracking (car __ir_tracking)))
       _ir_tracking)))
  (:raw_battery
   (&optional __raw_battery)
   (if __raw_battery (setq _raw_battery __raw_battery)) _raw_battery)
  (:percent_battery
   (&optional __percent_battery)
   (if __percent_battery (setq _percent_battery __percent_battery)) _percent_battery)
  (:zeroing_time
   (&optional __zeroing_time)
   (if __zeroing_time (setq _zeroing_time __zeroing_time)) _zeroing_time)
  (:errors
   (&optional __errors)
   (if __errors (setq _errors __errors)) _errors)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _angular_velocity_zeroed
    (send _angular_velocity_zeroed :serialization-length)
    ;; geometry_msgs/Vector3 _angular_velocity_raw
    (send _angular_velocity_raw :serialization-length)
    ;; float64[9] _angular_velocity_covariance
    (* 8    9)
    ;; geometry_msgs/Vector3 _linear_acceleration_zeroed
    (send _linear_acceleration_zeroed :serialization-length)
    ;; geometry_msgs/Vector3 _linear_acceleration_raw
    (send _linear_acceleration_raw :serialization-length)
    ;; float64[9] _linear_acceleration_covariance
    (* 8    9)
    ;; geometry_msgs/Vector3 _nunchuk_acceleration_zeroed
    (send _nunchuk_acceleration_zeroed :serialization-length)
    ;; geometry_msgs/Vector3 _nunchuk_acceleration_raw
    (send _nunchuk_acceleration_raw :serialization-length)
    ;; float32[2] _nunchuk_joystick_zeroed
    (* 4    2)
    ;; float32[2] _nunchuk_joystick_raw
    (* 4    2)
    ;; bool[11] _buttons
    (* 1    11)
    ;; bool[2] _nunchuk_buttons
    (* 1    2)
    ;; bool[4] _LEDs
    (* 1    4)
    ;; bool _rumble
    1
    ;; wiimote/IrSourceInfo[] _ir_tracking
    (apply #'+ (send-all _ir_tracking :serialization-length)) 4
    ;; float32 _raw_battery
    4
    ;; float32 _percent_battery
    4
    ;; time _zeroing_time
    8
    ;; uint64 _errors
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _angular_velocity_zeroed
       (send _angular_velocity_zeroed :serialize s)
     ;; geometry_msgs/Vector3 _angular_velocity_raw
       (send _angular_velocity_raw :serialize s)
     ;; float64[9] _angular_velocity_covariance
     (dotimes (i 9)
       (sys::poke (elt _angular_velocity_covariance i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Vector3 _linear_acceleration_zeroed
       (send _linear_acceleration_zeroed :serialize s)
     ;; geometry_msgs/Vector3 _linear_acceleration_raw
       (send _linear_acceleration_raw :serialize s)
     ;; float64[9] _linear_acceleration_covariance
     (dotimes (i 9)
       (sys::poke (elt _linear_acceleration_covariance i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Vector3 _nunchuk_acceleration_zeroed
       (send _nunchuk_acceleration_zeroed :serialize s)
     ;; geometry_msgs/Vector3 _nunchuk_acceleration_raw
       (send _nunchuk_acceleration_raw :serialize s)
     ;; float32[2] _nunchuk_joystick_zeroed
     (dotimes (i 2)
       (sys::poke (elt _nunchuk_joystick_zeroed i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _nunchuk_joystick_raw
     (dotimes (i 2)
       (sys::poke (elt _nunchuk_joystick_raw i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; bool[11] _buttons
     (dotimes (i 11)
       (if (elt _buttons i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[2] _nunchuk_buttons
     (dotimes (i 2)
       (if (elt _nunchuk_buttons i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool[4] _LEDs
     (dotimes (i 4)
       (if (elt _LEDs i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; bool _rumble
       (if _rumble (write-byte -1 s) (write-byte 0 s))
     ;; wiimote/IrSourceInfo[] _ir_tracking
     (write-long (length _ir_tracking) s)
     (dolist (elem _ir_tracking)
       (send elem :serialize s)
       )
     ;; float32 _raw_battery
       (sys::poke _raw_battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _percent_battery
       (sys::poke _percent_battery (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; time _zeroing_time
       (write-long (send _zeroing_time :sec) s) (write-long (send _zeroing_time :nsec) s)
     ;; uint64 _errors
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _errors (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _errors) (= (length (_errors . bv)) 2)) ;; bignum
              (write-long (ash (elt (_errors . bv) 0) 0) s)
              (write-long (ash (elt (_errors . bv) 1) -1) s))
             ((and (class _errors) (= (length (_errors . bv)) 1)) ;; big1
              (write-long (elt (_errors . bv) 0) s)
              (write-long (if (>= _errors 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _errors s)(write-long (if (>= _errors 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _angular_velocity_zeroed
     (send _angular_velocity_zeroed :deserialize buf ptr-) (incf ptr- (send _angular_velocity_zeroed :serialization-length))
   ;; geometry_msgs/Vector3 _angular_velocity_raw
     (send _angular_velocity_raw :deserialize buf ptr-) (incf ptr- (send _angular_velocity_raw :serialization-length))
   ;; float64[9] _angular_velocity_covariance
   (dotimes (i (length _angular_velocity_covariance))
     (setf (elt _angular_velocity_covariance i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; geometry_msgs/Vector3 _linear_acceleration_zeroed
     (send _linear_acceleration_zeroed :deserialize buf ptr-) (incf ptr- (send _linear_acceleration_zeroed :serialization-length))
   ;; geometry_msgs/Vector3 _linear_acceleration_raw
     (send _linear_acceleration_raw :deserialize buf ptr-) (incf ptr- (send _linear_acceleration_raw :serialization-length))
   ;; float64[9] _linear_acceleration_covariance
   (dotimes (i (length _linear_acceleration_covariance))
     (setf (elt _linear_acceleration_covariance i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; geometry_msgs/Vector3 _nunchuk_acceleration_zeroed
     (send _nunchuk_acceleration_zeroed :deserialize buf ptr-) (incf ptr- (send _nunchuk_acceleration_zeroed :serialization-length))
   ;; geometry_msgs/Vector3 _nunchuk_acceleration_raw
     (send _nunchuk_acceleration_raw :deserialize buf ptr-) (incf ptr- (send _nunchuk_acceleration_raw :serialization-length))
   ;; float32[2] _nunchuk_joystick_zeroed
   (dotimes (i (length _nunchuk_joystick_zeroed))
     (setf (elt _nunchuk_joystick_zeroed i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _nunchuk_joystick_raw
   (dotimes (i (length _nunchuk_joystick_raw))
     (setf (elt _nunchuk_joystick_raw i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; bool[11] _buttons
   (dotimes (i (length _buttons))
     (setf (elt _buttons i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; bool[2] _nunchuk_buttons
   (dotimes (i (length _nunchuk_buttons))
     (setf (elt _nunchuk_buttons i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; bool[4] _LEDs
   (dotimes (i (length _LEDs))
     (setf (elt _LEDs i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; bool _rumble
     (setq _rumble (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; wiimote/IrSourceInfo[] _ir_tracking
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ir_tracking (let (r) (dotimes (i n) (push (instance wiimote::IrSourceInfo :init) r)) r))
     (dolist (elem- _ir_tracking)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32 _raw_battery
     (setq _raw_battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _percent_battery
     (setq _percent_battery (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; time _zeroing_time
     (send _zeroing_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _zeroing_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint64 _errors
     
#+(or :alpha :irix6 :x86_64)
      (setf _errors (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _errors (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get wiimote::State :md5sum-) "a69651e8129655c6ed3c5039e468362c")
(setf (get wiimote::State :datatype-) "wiimote/State")
(setf (get wiimote::State :definition-)
      "#
#          Wiimote State message containing one complete Wiimote state

# Note: For ease of manipulation this message often uses
#       int8[] when a bit vector would work. One might
#       wish to use uint8[], but then Python takes
#       the respective structure as a string and disallows
#       item assignment.

int8    INVALID       = -1
float32 INVALID_FLOAT = -1.0

int8 MSG_BTN_1     = 0
int8 MSG_BTN_2     = 1
int8 MSG_BTN_A     = 2
int8 MSG_BTN_B     = 3
int8 MSG_BTN_PLUS  = 4
int8 MSG_BTN_MINUS = 5
int8 MSG_BTN_LEFT  = 6
int8 MSG_BTN_RIGHT = 7
int8 MSG_BTN_UP    = 8
int8 MSG_BTN_DOWN  = 9
int8 MSG_BTN_HOME  = 10
int8 MSG_BTN_Z     = 0
int8 MSG_BTN_C     = 1
int8 MSG_CLASSIC_BTN_X       = 0
int8 MSG_CLASSIC_BTN_Y       = 1
int8 MSG_CLASSIC_BTN_A       = 2
int8 MSG_CLASSIC_BTN_B       = 3
int8 MSG_CLASSIC_BTN_PLUS    = 4
int8 MSG_CLASSIC_BTN_MINUS   = 5
int8 MSG_CLASSIC_BTN_LEFT    = 6
int8 MSG_CLASSIC_BTN_RIGHT   = 7
int8 MSG_CLASSIC_BTN_UP      = 8
int8 MSG_CLASSIC_BTN_DOWN    = 9
int8 MSG_CLASSIC_BTN_HOME    = 10
int8 MSG_CLASSIC_BTN_L       = 11
int8 MSG_CLASSIC_BTN_R       = 12
int8 MSG_CLASSIC_BTN_ZL      = 13
int8 MSG_CLASSIC_BTN_ZR      = 14

#-----------------------------
# Header
#----------------------

Header header

#----------------------
# Gyro reading
#-----------------------------
# In radians/sec. If reading is invalid,
# for instance b/c no gyro is attached to the Wii, then
# set first element of covariance to -1 (same as imu_data.msg):
# Covariance matrix (roll, pitch, yaw) in radians^2/sec^2.

geometry_msgs/Vector3 angular_velocity_zeroed
geometry_msgs/Vector3 angular_velocity_raw
float64[9] angular_velocity_covariance

#----------------------
# Accelerometer reading
#-----------------------------
# Acceleration in m/sec^2. Covariance matrix
# (x,y,z) in m^2/sec^4.  (all same as imu_data.msg)

geometry_msgs/Vector3 linear_acceleration_zeroed
geometry_msgs/Vector3 linear_acceleration_raw
float64[9] linear_acceleration_covariance

#------------------------------
# Nunchuk Accelerometer reading
#------------------------------
geometry_msgs/Vector3 nunchuk_acceleration_zeroed
geometry_msgs/Vector3 nunchuk_acceleration_raw

#-----------------
# Nunchuk Joystick
#-----------------
float32[2] nunchuk_joystick_zeroed
float32[2] nunchuk_joystick_raw

#----------------------
# Wiimote buttons
#-----------------------------
# Mappings from Wiimote button name
# to array position are defined above.
#
bool[11] buttons
bool[2] nunchuk_buttons

#----------------------
# Wiimote LED states:
#-----------------------------

bool[4] LEDs

#----------------------
# Wiimote Rumble
#-----------------------------
# State (True or False)

bool rumble

#----------------------
# IR Light sensor (Camera)
#-----------------------------
# The Wiimote handles up to four light sources, 
# and the wiimote_node.py software is written to 
# that limit as well. For future expansion
# we make the following array extensible, rather
# than locking its length down to four:

wiimote/IrSourceInfo[] ir_tracking

#----------------------
# Wiimote battery
#-----------------------------
# A battery reading consists of two numbers: 
# the battery percentage, and the raw reading.
# Maximum battery is 208 units (unknown how this
# relates to electrical properties): 

float32 raw_battery
float32 percent_battery

#----------------------
# Time of most recent zeroing:
#-----------------------------

time zeroing_time

#----------------------
# Error vector
#-----------------------------
# For error condition definitions see wiimoteConstants.py
# Value of zero means all is well. (Currently NOT used).

uint64 errors

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
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: wiimote/IrSourceInfo
# Sensor data pertaining to the Wiimote infrared camera.
# This message contains data for one of the four infrared 
# light sources that the camera detects.
#
# Each light is specified with a 2D position and 
# a 'source magnitude' (ir_size). If the x dimension
# is set to INVALID_FLOAT, then no light was detected for 
# the respective light. The Wiimote handles up to
# four light sources, and the wiimote_node.py software
# is written to that limit as well.
#
# I am unsure what the 'ir_size' values represent. 
# They are described as 'source magnitude' in some places. I
# *assume* this is signal amplitude, but it's unclear. 
# Note that current lowest level cwiid driver does not 
# seem to pass the ir_size value to the cwiid Wiimote.c. 
# For now this size will therefore be set INVALID

float64 x 
float64 y 
int64 ir_size

")



(provide :wiimote/State "a69651e8129655c6ed3c5039e468362c")


