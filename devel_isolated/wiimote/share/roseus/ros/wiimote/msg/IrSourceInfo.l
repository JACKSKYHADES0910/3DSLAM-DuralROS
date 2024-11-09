;; Auto-generated. Do not edit!


(when (boundp 'wiimote::IrSourceInfo)
  (if (not (find-package "WIIMOTE"))
    (make-package "WIIMOTE"))
  (shadow 'IrSourceInfo (find-package "WIIMOTE")))
(unless (find-package "WIIMOTE::IRSOURCEINFO")
  (make-package "WIIMOTE::IRSOURCEINFO"))

(in-package "ROS")
;;//! \htmlinclude IrSourceInfo.msg.html


(defclass wiimote::IrSourceInfo
  :super ros::object
  :slots (_x _y _ir_size ))

(defmethod wiimote::IrSourceInfo
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:ir_size __ir_size) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _ir_size (round __ir_size))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:ir_size
   (&optional __ir_size)
   (if __ir_size (setq _ir_size __ir_size)) _ir_size)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; int64 _ir_size
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int64 _ir_size
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ir_size (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ir_size) (= (length (_ir_size . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ir_size . bv) 0) 0) s)
              (write-long (ash (elt (_ir_size . bv) 1) -1) s))
             ((and (class _ir_size) (= (length (_ir_size . bv)) 1)) ;; big1
              (write-long (elt (_ir_size . bv) 0) s)
              (write-long (if (>= _ir_size 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ir_size s)(write-long (if (>= _ir_size 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int64 _ir_size
#+(or :alpha :irix6 :x86_64)
      (setf _ir_size (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ir_size (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get wiimote::IrSourceInfo :md5sum-) "95274ca88b9f008b99984b9a61d2772e")
(setf (get wiimote::IrSourceInfo :datatype-) "wiimote/IrSourceInfo")
(setf (get wiimote::IrSourceInfo :definition-)
      "# Sensor data pertaining to the Wiimote infrared camera.
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



(provide :wiimote/IrSourceInfo "95274ca88b9f008b99984b9a61d2772e")


