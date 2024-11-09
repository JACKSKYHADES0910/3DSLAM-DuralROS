
(cl:in-package :asdf)

(defsystem "path_server-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetPathName" :depends-on ("_package_SetPathName"))
    (:file "_package_SetPathName" :depends-on ("_package"))
  ))