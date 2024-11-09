
(cl:in-package :asdf)

(defsystem "autolabor_canbus_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CanBusMessage" :depends-on ("_package_CanBusMessage"))
    (:file "_package_CanBusMessage" :depends-on ("_package"))
  ))