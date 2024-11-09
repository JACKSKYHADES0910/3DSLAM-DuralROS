
(cl:in-package :asdf)

(defsystem "ch104m-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Imu_0x91_msg" :depends-on ("_package_Imu_0x91_msg"))
    (:file "_package_Imu_0x91_msg" :depends-on ("_package"))
    (:file "Imu_data_package" :depends-on ("_package_Imu_data_package"))
    (:file "_package_Imu_data_package" :depends-on ("_package"))
  ))