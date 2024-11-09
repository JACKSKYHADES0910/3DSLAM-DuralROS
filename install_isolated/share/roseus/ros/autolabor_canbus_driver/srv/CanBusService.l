;; Auto-generated. Do not edit!


(when (boundp 'autolabor_canbus_driver::CanBusService)
  (if (not (find-package "AUTOLABOR_CANBUS_DRIVER"))
    (make-package "AUTOLABOR_CANBUS_DRIVER"))
  (shadow 'CanBusService (find-package "AUTOLABOR_CANBUS_DRIVER")))
(unless (find-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICE")
  (make-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICE"))
(unless (find-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICEREQUEST")
  (make-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICEREQUEST"))
(unless (find-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICERESPONSE")
  (make-package "AUTOLABOR_CANBUS_DRIVER::CANBUSSERVICERESPONSE"))

(in-package "ROS")





(defclass autolabor_canbus_driver::CanBusServiceRequest
  :super ros::object
  :slots (_requests ))

(defmethod autolabor_canbus_driver::CanBusServiceRequest
  (:init
   (&key
    ((:requests __requests) ())
    )
   (send-super :init)
   (setq _requests __requests)
   self)
  (:requests
   (&rest __requests)
   (if (keywordp (car __requests))
       (send* _requests __requests)
     (progn
       (if __requests (setq _requests (car __requests)))
       _requests)))
  (:serialization-length
   ()
   (+
    ;; autolabor_canbus_driver/CanBusMessage[] _requests
    (apply #'+ (send-all _requests :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; autolabor_canbus_driver/CanBusMessage[] _requests
     (write-long (length _requests) s)
     (dolist (elem _requests)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; autolabor_canbus_driver/CanBusMessage[] _requests
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _requests (let (r) (dotimes (i n) (push (instance autolabor_canbus_driver::CanBusMessage :init) r)) r))
     (dolist (elem- _requests)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass autolabor_canbus_driver::CanBusServiceResponse
  :super ros::object
  :slots ())

(defmethod autolabor_canbus_driver::CanBusServiceResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass autolabor_canbus_driver::CanBusService
  :super ros::object
  :slots ())

(setf (get autolabor_canbus_driver::CanBusService :md5sum-) "9a9cc9390520695f9967803f5179d063")
(setf (get autolabor_canbus_driver::CanBusService :datatype-) "autolabor_canbus_driver/CanBusService")
(setf (get autolabor_canbus_driver::CanBusService :request) autolabor_canbus_driver::CanBusServiceRequest)
(setf (get autolabor_canbus_driver::CanBusService :response) autolabor_canbus_driver::CanBusServiceResponse)

(defmethod autolabor_canbus_driver::CanBusServiceRequest
  (:response () (instance autolabor_canbus_driver::CanBusServiceResponse :init)))

(setf (get autolabor_canbus_driver::CanBusServiceRequest :md5sum-) "9a9cc9390520695f9967803f5179d063")
(setf (get autolabor_canbus_driver::CanBusServiceRequest :datatype-) "autolabor_canbus_driver/CanBusServiceRequest")
(setf (get autolabor_canbus_driver::CanBusServiceRequest :definition-)
      "autolabor_canbus_driver/CanBusMessage[] requests

================================================================================
MSG: autolabor_canbus_driver/CanBusMessage
uint8 node_type
uint8 node_seq
uint8 msg_type
---
")

(setf (get autolabor_canbus_driver::CanBusServiceResponse :md5sum-) "9a9cc9390520695f9967803f5179d063")
(setf (get autolabor_canbus_driver::CanBusServiceResponse :datatype-) "autolabor_canbus_driver/CanBusServiceResponse")
(setf (get autolabor_canbus_driver::CanBusServiceResponse :definition-)
      "autolabor_canbus_driver/CanBusMessage[] requests

================================================================================
MSG: autolabor_canbus_driver/CanBusMessage
uint8 node_type
uint8 node_seq
uint8 msg_type
---
")



(provide :autolabor_canbus_driver/CanBusService "9a9cc9390520695f9967803f5179d063")


