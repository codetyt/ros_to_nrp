
(cl:in-package :asdf)

(defsystem "cpg_to_cdp1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MyMuscleState" :depends-on ("_package_MyMuscleState"))
    (:file "_package_MyMuscleState" :depends-on ("_package"))
    (:file "MyMuscleStates" :depends-on ("_package_MyMuscleStates"))
    (:file "_package_MyMuscleStates" :depends-on ("_package"))
  ))