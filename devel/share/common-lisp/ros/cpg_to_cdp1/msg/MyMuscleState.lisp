; Auto-generated. Do not edit!


(cl:in-package cpg_to_cdp1-msg)


;//! \htmlinclude MyMuscleState.msg.html

(cl:defclass <MyMuscleState> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (force
    :reader force
    :initarg :force
    :type cl:float
    :initform 0.0)
   (length
    :reader length
    :initarg :length
    :type cl:float
    :initform 0.0)
   (lengthening_speed
    :reader lengthening_speed
    :initarg :lengthening_speed
    :type cl:float
    :initform 0.0)
   (path_points
    :reader path_points
    :initarg :path_points
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3))))
)

(cl:defclass MyMuscleState (<MyMuscleState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MyMuscleState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MyMuscleState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cpg_to_cdp1-msg:<MyMuscleState> is deprecated: use cpg_to_cdp1-msg:MyMuscleState instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MyMuscleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:name-val is deprecated.  Use cpg_to_cdp1-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <MyMuscleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:force-val is deprecated.  Use cpg_to_cdp1-msg:force instead.")
  (force m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <MyMuscleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:length-val is deprecated.  Use cpg_to_cdp1-msg:length instead.")
  (length m))

(cl:ensure-generic-function 'lengthening_speed-val :lambda-list '(m))
(cl:defmethod lengthening_speed-val ((m <MyMuscleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:lengthening_speed-val is deprecated.  Use cpg_to_cdp1-msg:lengthening_speed instead.")
  (lengthening_speed m))

(cl:ensure-generic-function 'path_points-val :lambda-list '(m))
(cl:defmethod path_points-val ((m <MyMuscleState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg_to_cdp1-msg:path_points-val is deprecated.  Use cpg_to_cdp1-msg:path_points instead.")
  (path_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MyMuscleState>) ostream)
  "Serializes a message object of type '<MyMuscleState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lengthening_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MyMuscleState>) istream)
  "Deserializes a message object of type '<MyMuscleState>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'length) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lengthening_speed) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MyMuscleState>)))
  "Returns string type for a message object of type '<MyMuscleState>"
  "cpg_to_cdp1/MyMuscleState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MyMuscleState)))
  "Returns string type for a message object of type 'MyMuscleState"
  "cpg_to_cdp1/MyMuscleState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MyMuscleState>)))
  "Returns md5sum for a message object of type '<MyMuscleState>"
  "5697b76bd7ab0565ec4ea37355d5a0b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MyMuscleState)))
  "Returns md5sum for a message object of type 'MyMuscleState"
  "5697b76bd7ab0565ec4ea37355d5a0b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MyMuscleState>)))
  "Returns full string definition for message of type '<MyMuscleState>"
  (cl:format cl:nil "# muscle state~%string name~%float32 force~%float32 length~%float32 lengthening_speed~%geometry_msgs/Vector3[] path_points~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MyMuscleState)))
  "Returns full string definition for message of type 'MyMuscleState"
  (cl:format cl:nil "# muscle state~%string name~%float32 force~%float32 length~%float32 lengthening_speed~%geometry_msgs/Vector3[] path_points~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MyMuscleState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MyMuscleState>))
  "Converts a ROS message object to a list"
  (cl:list 'MyMuscleState
    (cl:cons ':name (name msg))
    (cl:cons ':force (force msg))
    (cl:cons ':length (length msg))
    (cl:cons ':lengthening_speed (lengthening_speed msg))
    (cl:cons ':path_points (path_points msg))
))
