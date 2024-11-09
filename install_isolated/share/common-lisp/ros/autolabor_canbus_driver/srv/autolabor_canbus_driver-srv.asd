
(cl:in-package :asdf)

(defsystem "autolabor_canbus_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :autolabor_canbus_driver-msg
)
  :components ((:file "_package")
    (:file "CanBusService" :depends-on ("_package_CanBusService"))
    (:file "_package_CanBusService" :depends-on ("_package"))
  ))