; Auto-generated. Do not edit!


(cl:in-package cpg_to_cdp1-msg)


;//! \htmlinclude MyMuscleStates.msg.html

(cl:defclass <MyMuscleStates> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (muscles
    :reader muscles
    :initarg :muscles
    :type (cl:vector cpg_to_cdp1-msg:MyMuscleState)
   :initform (cl:make-array 0 :element-type 'cpg_to_cdp1-msg:MyMuscleState :initial-element (cl:make-instance 'cpg_to_cdp1-msg:MyMuscleState))))
)

(cl:defclass MyMuscleStates (<MyMuscleStates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MyMuscleStates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MyMuscleStates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cpg_to_cdp1-msg:<MyMuscleStates> is deprecated: use cpg_to_cdp1-msg:MyMuscleStates instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MyMuscleStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:header-val is deprecated.  Use cpg_to_cdp1-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'muscles-val :lambda-list '(m))
(cl:defmethod muscles-val ((m <MyMuscleStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:muscles-val is deprecated.  Use cpg_to_cdp1-msg:muscles instead.")
  (muscles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MyMuscleStates>) ostream)
  "Serializes a message object of type '<MyMuscleStates>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'muscles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'muscles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MyMuscleStates>) istream)
  "Deserializes a message object of type '<MyMuscleStates>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'muscles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'muscles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cpg_to_cdp1-msg:MyMuscleState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MyMuscleStates>)))
  "Returns string type for a message object of type '<MyMuscleStates>"
  "cpg_to_cdp1/MyMuscleStates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MyMuscleStates)))
  "Returns string type for a message object of type 'MyMuscleStates"
  "cpg_to_cdp1/MyMuscleStates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MyMuscleStates>)))
  "Returns md5sum for a message object of type '<MyMuscleStates>"
  "68a8a94a76f8e57fa8ecb44dba7bb6da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MyMuscleStates)))
  "Returns md5sum for a message object of type 'MyMuscleStates"
  "68a8a94a76f8e57fa8ecb44dba7bb6da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MyMuscleStates>)))
  "Returns full string definition for message of type '<MyMuscleStates>"
  (cl:format cl:nil "Header header~%# broadcast all muscle states in world frame~%MyMuscleState[] muscles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cpg_to_cdp1/MyMuscleState~%# muscle state~%string name~%float32 force~%float32 length~%float32 lengthening_speed~%geometry_msgs/Vector3[] path_points~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MyMuscleStates)))
  "Returns full string definition for message of type 'MyMuscleStates"
  (cl:format cl:nil "Header header~%# broadcast all muscle states in world frame~%MyMuscleState[] muscles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cpg_to_cdp1/MyMuscleState~%# muscle state~%string name~%float32 force~%float32 length~%float32 lengthening_speed~%geometry_msgs/Vector3[] path_points~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MyMuscleStates>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'muscles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MyMuscleStates>))
  "Converts a ROS message object to a list"
  (cl:list 'MyMuscleStates
    (cl:cons ':header (header msg))
    (cl:cons ':muscles (muscles msg))
))
