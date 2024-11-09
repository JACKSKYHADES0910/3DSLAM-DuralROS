
(cl:in-package :asdf)

(defsystem "autolabor_pro1_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Encode" :depends-on ("_package_Encode"))
    (:file "_package_Encode" :depends-on ("_package"))
  ))