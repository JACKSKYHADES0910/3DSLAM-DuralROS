;; Auto-generated. Do not edit!


(when (boundp 'path_server::SetPathName)
  (if (not (find-package "PATH_SERVER"))
    (make-package "PATH_SERVER"))
  (shadow 'SetPathName (find-package "PATH_SERVER")))
(unless (find-package "PATH_SERVER::SETPATHNAME")
  (make-package "PATH_SERVER::SETPATHNAME"))
(unless (find-package "PATH_SERVER::SETPATHNAMEREQUEST")
  (make-package "PATH_SERVER::SETPATHNAMEREQUEST"))
(unless (find-package "PATH_SERVER::SETPATHNAMERESPONSE")
  (make-package "PATH_SERVER::SETPATHNAMERESPONSE"))

(in-package "ROS")





(defclass path_server::SetPathNameRequest
  :super ros::object
  :slots (_path_name ))

(defmethod path_server::SetPathNameRequest
  (:init
   (&key
    ((:path_name __path_name) "")
    )
   (send-super :init)
   (setq _path_name (string __path_name))
   self)
  (:path_name
   (&optional __path_name)
   (if __path_name (setq _path_name __path_name)) _path_name)
  (:serialization-length
   ()
   (+
    ;; string _path_name
    4 (length _path_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path_name
       (write-long (length _path_name) s) (princ _path_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_server::SetPathNameResponse
  :super ros::object
  :slots ())

(defmethod path_server::SetPathNameResponse
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

(defclass path_server::SetPathName
  :super ros::object
  :slots ())

(setf (get path_server::SetPathName :md5sum-) "3572e731ca915997319cdf3e8b7f260b")
(setf (get path_server::SetPathName :datatype-) "path_server/SetPathName")
(setf (get path_server::SetPathName :request) path_server::SetPathNameRequest)
(setf (get path_server::SetPathName :response) path_server::SetPathNameResponse)

(defmethod path_server::SetPathNameRequest
  (:response () (instance path_server::SetPathNameResponse :init)))

(setf (get path_server::SetPathNameRequest :md5sum-) "3572e731ca915997319cdf3e8b7f260b")
(setf (get path_server::SetPathNameRequest :datatype-) "path_server/SetPathNameRequest")
(setf (get path_server::SetPathNameRequest :definition-)
      "string path_name
---
")

(setf (get path_server::SetPathNameResponse :md5sum-) "3572e731ca915997319cdf3e8b7f260b")
(setf (get path_server::SetPathNameResponse :datatype-) "path_server/SetPathNameResponse")
(setf (get path_server::SetPathNameResponse :definition-)
      "string path_name
---
")



(provide :path_server/SetPathName "3572e731ca915997319cdf3e8b7f260b")


