
(cl:in-package :asdf)

(defsystem "marvelmind-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "beacon_pos" :depends-on ("_package_beacon_pos"))
    (:file "_package_beacon_pos" :depends-on ("_package"))
  ))