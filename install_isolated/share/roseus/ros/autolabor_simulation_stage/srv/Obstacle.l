;; Auto-generated. Do not edit!


(when (boundp 'autolabor_simulation_stage::Obstacle)
  (if (not (find-package "AUTOLABOR_SIMULATION_STAGE"))
    (make-package "AUTOLABOR_SIMULATION_STAGE"))
  (shadow 'Obstacle (find-package "AUTOLABOR_SIMULATION_STAGE")))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLE")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLE"))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(unless (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLERESPONSE")
  (make-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(intern "*NEW*" (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(shadow '*NEW* (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(defconstant autolabor_simulation_stage::ObstacleRequest::*NEW* 0)
(intern "*TRANSFORM*" (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(shadow '*TRANSFORM* (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(defconstant autolabor_simulation_stage::ObstacleRequest::*TRANSFORM* 1)
(intern "*DELETE*" (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(shadow '*DELETE* (find-package "AUTOLABOR_SIMULATION_STAGE::OBSTACLEREQUEST"))
(defconstant autolabor_simulation_stage::ObstacleRequest::*DELETE* 2)

(defun autolabor_simulation_stage::ObstacleRequest-to-symbol (const)
  (cond
        ((= const 0) 'autolabor_simulation_stage::ObstacleRequest::*NEW*)
        ((= const 1) 'autolabor_simulation_stage::ObstacleRequest::*TRANSFORM*)
        ((= const 2) 'autolabor_simulation_stage::ObstacleRequest::*DELETE*)
        (t nil)))

(defclass autolabor_simulation_stage::ObstacleRequest
  :super ros::object
  :slots (_obstacle_id _type _transform _vertex ))

(defmethod autolabor_simulation_stage::ObstacleRequest
  (:init
   (&key
    ((:obstacle_id __obstacle_id) "")
    ((:type __type) 0)
    ((:transform __transform) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:vertex __vertex) ())
    )
   (send-super :init)
   (setq _obstacle_id (string __obstacle_id))
   (setq _type (round __type))
   (setq _transform __transform)
   (setq _vertex __vertex)
   self)
  (:obstacle_id
   (&optional __obstacle_id)
   (if __obstacle_id (setq _obstacle_id __obstacle_id)) _obstacle_id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:transform
   (&optional __transform)
   (if __transform (setq _transform __transform)) _transform)
  (:vertex
   (&rest __vertex)
   (if (keywordp (car __vertex))
       (send* _vertex __vertex)
     (progn
       (if __vertex (setq _vertex (car __vertex)))
       _vertex)))
  (:serialization-length
   ()
   (+
    ;; string _obstacle_id
    4 (length _obstacle_id)
    ;; uint8 _type
    1
    ;; float32[3] _transform
    (* 4    3)
    ;; geometry_msgs/Polygon[] _vertex
    (apply #'+ (send-all _vertex :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _obstacle_id
       (write-long (length _obstacle_id) s) (princ _obstacle_id s)
     ;; uint8 _type
       (write-byte _type s)
     ;; float32[3] _transform
     (dotimes (i 3)
       (sys::poke (elt _transform i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; geometry_msgs/Polygon[] _vertex
     (write-long (length _vertex) s)
     (dolist (elem _vertex)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _obstacle_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _obstacle_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[3] _transform
   (dotimes (i (length _transform))
     (setf (elt _transform i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; geometry_msgs/Polygon[] _vertex
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vertex (let (r) (dotimes (i n) (push (instance geometry_msgs::Polygon :init) r)) r))
     (dolist (elem- _vertex)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass autolabor_simulation_stage::ObstacleResponse
  :super ros::object
  :slots ())

(defmethod autolabor_simulation_stage::ObstacleResponse
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

(defclass autolabor_simulation_stage::Obstacle
  :super ros::object
  :slots ())

(setf (get autolabor_simulation_stage::Obstacle :md5sum-) "16784fb8acead2e3b4470fa59f07d999")
(setf (get autolabor_simulation_stage::Obstacle :datatype-) "autolabor_simulation_stage/Obstacle")
(setf (get autolabor_simulation_stage::Obstacle :request) autolabor_simulation_stage::ObstacleRequest)
(setf (get autolabor_simulation_stage::Obstacle :response) autolabor_simulation_stage::ObstacleResponse)

(defmethod autolabor_simulation_stage::ObstacleRequest
  (:response () (instance autolabor_simulation_stage::ObstacleResponse :init)))

(setf (get autolabor_simulation_stage::ObstacleRequest :md5sum-) "16784fb8acead2e3b4470fa59f07d999")
(setf (get autolabor_simulation_stage::ObstacleRequest :datatype-) "autolabor_simulation_stage/ObstacleRequest")
(setf (get autolabor_simulation_stage::ObstacleRequest :definition-)
      "uint8 NEW=0
uint8 TRANSFORM=1
uint8 DELETE=2

string obstacle_id
uint8 type
float32[3] transform
geometry_msgs/Polygon[] vertex

================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
---

")

(setf (get autolabor_simulation_stage::ObstacleResponse :md5sum-) "16784fb8acead2e3b4470fa59f07d999")
(setf (get autolabor_simulation_stage::ObstacleResponse :datatype-) "autolabor_simulation_stage/ObstacleResponse")
(setf (get autolabor_simulation_stage::ObstacleResponse :definition-)
      "uint8 NEW=0
uint8 TRANSFORM=1
uint8 DELETE=2

string obstacle_id
uint8 type
float32[3] transform
geometry_msgs/Polygon[] vertex

================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
---

")



(provide :autolabor_simulation_stage/Obstacle "16784fb8acead2e3b4470fa59f07d999")


