;; Auto-generated. Do not edit!


(when (boundp 'cpg_to_cdp1::MyMuscleStates)
  (if (not (find-package "CPG_TO_CDP1"))
    (make-package "CPG_TO_CDP1"))
  (shadow 'MyMuscleStates (find-package "CPG_TO_CDP1")))
(unless (find-package "CPG_TO_CDP1::MYMUSCLESTATES")
  (make-package "CPG_TO_CDP1::MYMUSCLESTATES"))

(in-package "ROS")
;;//! \htmlinclude MyMuscleStates.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cpg_to_cdp1::MyMuscleStates
  :super ros::object
  :slots (_header _muscles ))

(defmethod cpg_to_cdp1::MyMuscleStates
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:muscles __muscles) (let (r) (dotimes (i 0) (push (instance cpg_to_cdp1::MyMuscleState :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _muscles __muscles)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:muscles
   (&rest __muscles)
   (if (keywordp (car __muscles))
       (send* _muscles __muscles)
     (progn
       (if __muscles (setq _muscles (car __muscles)))
       _muscles)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; cpg_to_cdp1/MyMuscleState[] _muscles
    (apply #'+ (send-all _muscles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; cpg_to_cdp1/MyMuscleState[] _muscles
     (write-long (length _muscles) s)
     (dolist (elem _muscles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; cpg_to_cdp1/MyMuscleState[] _muscles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _muscles (let (r) (dotimes (i n) (push (instance cpg_to_cdp1::MyMuscleState :init) r)) r))
     (dolist (elem- _muscles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cpg_to_cdp1::MyMuscleStates :md5sum-) "68a8a94a76f8e57fa8ecb44dba7bb6da")
(setf (get cpg_to_cdp1::MyMuscleStates :datatype-) "cpg_to_cdp1/MyMuscleStates")
(setf (get cpg_to_cdp1::MyMuscleStates :definition-)
      "Header header
# broadcast all muscle states in world frame
MyMuscleState[] muscles
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: cpg_to_cdp1/MyMuscleState
# muscle state
string name
float32 force
float32 length
float32 lengthening_speed
geometry_msgs/Vector3[] path_points
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :cpg_to_cdp1/MyMuscleStates "68a8a94a76f8e57fa8ecb44dba7bb6da")


