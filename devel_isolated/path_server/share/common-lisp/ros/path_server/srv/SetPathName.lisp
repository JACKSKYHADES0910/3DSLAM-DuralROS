; Auto-generated. Do not edit!


(cl:in-package path_server-srv)


;//! \htmlinclude SetPathName-request.msg.html

(cl:defclass <SetPathName-request> (roslisp-msg-protocol:ros-message)
  ((path_name
    :reader path_name
    :initarg :path_name
    :type cl:string
    :initform ""))
)

(cl:defclass SetPathName-request (<SetPathName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPathName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPathName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_server-srv:<SetPathName-request> is deprecated: use path_server-srv:SetPathName-request instead.")))

(cl:ensure-generic-function 'path_name-val :lambda-list '(m))
(cl:defmethod path_name-val ((m <SetPathName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_server-srv:path_name-val is deprecated.  Use path_server-srv:path_name instead.")
  (path_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPathName-request>) ostream)
  "Serializes a message object of type '<SetPathName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPathName-request>) istream)
  "Deserializes a message object of type '<SetPathName-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPathName-request>)))
  "Returns string type for a service object of type '<SetPathName-request>"
  "path_server/SetPathNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathName-request)))
  "Returns string type for a service object of type 'SetPathName-request"
  "path_server/SetPathNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPathName-request>)))
  "Returns md5sum for a message object of type '<SetPathName-request>"
  "3572e731ca915997319cdf3e8b7f260b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPathName-request)))
  "Returns md5sum for a message object of type 'SetPathName-request"
  "3572e731ca915997319cdf3e8b7f260b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPathName-request>)))
  "Returns full string definition for message of type '<SetPathName-request>"
  (cl:format cl:nil "string path_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPathName-request)))
  "Returns full string definition for message of type 'SetPathName-request"
  (cl:format cl:nil "string path_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPathName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPathName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPathName-request
    (cl:cons ':path_name (path_name msg))
))
;//! \htmlinclude SetPathName-response.msg.html

(cl:defclass <SetPathName-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetPathName-response (<SetPathName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPathName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPathName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_server-srv:<SetPathName-response> is deprecated: use path_server-srv:SetPathName-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPathName-response>) ostream)
  "Serializes a message object of type '<SetPathName-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPathName-response>) istream)
  "Deserializes a message object of type '<SetPathName-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPathName-response>)))
  "Returns string type for a service object of type '<SetPathName-response>"
  "path_server/SetPathNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathName-response)))
  "Returns string type for a service object of type 'SetPathName-response"
  "path_server/SetPathNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPathName-response>)))
  "Returns md5sum for a message object of type '<SetPathName-response>"
  "3572e731ca915997319cdf3e8b7f260b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPathName-response)))
  "Returns md5sum for a message object of type 'SetPathName-response"
  "3572e731ca915997319cdf3e8b7f260b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPathName-response>)))
  "Returns full string definition for message of type '<SetPathName-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPathName-response)))
  "Returns full string definition for message of type 'SetPathName-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPathName-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPathName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPathName-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPathName)))
  'SetPathName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPathName)))
  'SetPathName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPathName)))
  "Returns string type for a service object of type '<SetPathName>"
  "path_server/SetPathName")