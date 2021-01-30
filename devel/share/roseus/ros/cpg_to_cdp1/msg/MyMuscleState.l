;; Auto-generated. Do not edit!


(when (boundp 'cpg_to_cdp1::MyMuscleState)
  (if (not (find-package "CPG_TO_CDP1"))
    (make-package "CPG_TO_CDP1"))
  (shadow 'MyMuscleState (find-package "CPG_TO_CDP1")))
(unless (find-package "CPG_TO_CDP1::MYMUSCLESTATE")
  (make-package "CPG_TO_CDP1::MYMUSCLESTATE"))

(in-package "ROS")
;;//! \htmlinclude MyMuscleState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass cpg_to_cdp1::MyMuscleState
  :super ros::object
  :slots (_name _force _length _lengthening_speed _path_points ))

(defmethod cpg_to_cdp1::MyMuscleState
  (:init
   (&key
    ((:name __name) "")
    ((:force __force) 0.0)
    ((:length __length) 0.0)
    ((:lengthening_speed __lengthening_speed) 0.0)
    ((:path_points __path_points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Vector3 :init) r)) r))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _force (float __force))
   (setq _length (float __length))
   (setq _lengthening_speed (float __lengthening_speed))
   (setq _path_points __path_points)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:lengthening_speed
   (&optional __lengthening_speed)
   (if __lengthening_speed (setq _lengthening_speed __lengthening_speed)) _lengthening_speed)
  (:path_points
   (&rest __path_points)
   (if (keywordp (car __path_points))
       (send* _path_points __path_points)
     (progn
       (if __path_points (setq _path_points (car __path_points)))
       _path_points)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _force
    4
    ;; float32 _length
    4
    ;; float32 _lengthening_speed
    4
    ;; geometry_msgs/Vector3[] _path_points
    (apply #'+ (send-all _path_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _force
       (sys::poke _force (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lengthening_speed
       (sys::poke _lengthening_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3[] _path_points
     (write-long (length _path_points) s)
     (dolist (elem _path_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _force
     (setq _force (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lengthening_speed
     (setq _lengthening_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3[] _path_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _path_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cpg_to_cdp1::MyMuscleState :md5sum-) "5697b76bd7ab0565ec4ea37355d5a0b2")
(setf (get cpg_to_cdp1::MyMuscleState :datatype-) "cpg_to_cdp1/MyMuscleState")
(setf (get cpg_to_cdp1::MyMuscleState :definition-)
      "# muscle state
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



(provide :cpg_to_cdp1/MyMuscleState "5697b76bd7ab0565ec4ea37355d5a0b2")


