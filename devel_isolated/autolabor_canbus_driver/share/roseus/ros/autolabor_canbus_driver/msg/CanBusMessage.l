;; Auto-generated. Do not edit!


(when (boundp 'autolabor_canbus_driver::CanBusMessage)
  (if (not (find-package "AUTOLABOR_CANBUS_DRIVER"))
    (make-package "AUTOLABOR_CANBUS_DRIVER"))
  (shadow 'CanBusMessage (find-package "AUTOLABOR_CANBUS_DRIVER")))
(unless (find-package "AUTOLABOR_CANBUS_DRIVER::CANBUSMESSAGE")
  (make-package "AUTOLABOR_CANBUS_DRIVER::CANBUSMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude CanBusMessage.msg.html


(defclass autolabor_canbus_driver::CanBusMessage
  :super ros::object
  :slots (_node_type _node_seq _msg_type _payload ))

(defmethod autolabor_canbus_driver::CanBusMessage
  (:init
   (&key
    ((:node_type __node_type) 0)
    ((:node_seq __node_seq) 0)
    ((:msg_type __msg_type) 0)
    ((:payload __payload) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _node_type (round __node_type))
   (setq _node_seq (round __node_seq))
   (setq _msg_type (round __msg_type))
   (setq _payload __payload)
   self)
  (:node_type
   (&optional __node_type)
   (if __node_type (setq _node_type __node_type)) _node_type)
  (:node_seq
   (&optional __node_seq)
   (if __node_seq (setq _node_seq __node_seq)) _node_seq)
  (:msg_type
   (&optional __msg_type)
   (if __msg_type (setq _msg_type __msg_type)) _msg_type)
  (:payload
   (&optional __payload)
   (if __payload (setq _payload __payload)) _payload)
  (:serialization-length
   ()
   (+
    ;; uint8 _node_type
    1
    ;; uint8 _node_seq
    1
    ;; uint8 _msg_type
    1
    ;; uint8[] _payload
    (* 1    (length _payload)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _node_type
       (write-byte _node_type s)
     ;; uint8 _node_seq
       (write-byte _node_seq s)
     ;; uint8 _msg_type
       (write-byte _msg_type s)
     ;; uint8[] _payload
     (write-long (length _payload) s)
     (princ _payload s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _node_type
     (setq _node_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _node_seq
     (setq _node_seq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _msg_type
     (setq _msg_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[] _payload
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _payload (make-array n :element-type :char))
     (replace _payload buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get autolabor_canbus_driver::CanBusMessage :md5sum-) "4fc00d85252b3621e3f37dfe24254deb")
(setf (get autolabor_canbus_driver::CanBusMessage :datatype-) "autolabor_canbus_driver/CanBusMessage")
(setf (get autolabor_canbus_driver::CanBusMessage :definition-)
      "uint8 node_type
uint8 node_seq
uint8 msg_type
uint8[] payload
")



(provide :autolabor_canbus_driver/CanBusMessage "4fc00d85252b3621e3f37dfe24254deb")


