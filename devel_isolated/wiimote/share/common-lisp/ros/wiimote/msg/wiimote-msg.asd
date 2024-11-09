
(cl:in-package :asdf)

(defsystem "wiimote-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "IrSourceInfo" :depends-on ("_package_IrSourceInfo"))
    (:file "_package_IrSourceInfo" :depends-on ("_package"))
    (:file "State" :depends-on ("_package_State"))
    (:file "_package_State" :depends-on ("_package"))
    (:file "TimedSwitch" :depends-on ("_package_TimedSwitch"))
    (:file "_package_TimedSwitch" :depends-on ("_package"))
  ))