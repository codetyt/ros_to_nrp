// Auto-generated. Do not edit!

// (in-package cpg_to_cdp1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MyMuscleState = require('./MyMuscleState.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MyMuscleStates {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.muscles = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('muscles')) {
        this.muscles = initObj.muscles
      }
      else {
        this.muscles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MyMuscleStates
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [muscles]
    // Serialize the length for message field [muscles]
    bufferOffset = _serializer.uint32(obj.muscles.length, buffer, bufferOffset);
    obj.muscles.forEach((val) => {
      bufferOffset = MyMuscleState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MyMuscleStates
    let len;
    let data = new MyMuscleStates(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [muscles]
    // Deserialize array length for message field [muscles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.muscles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.muscles[i] = MyMuscleState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.muscles.forEach((val) => {
      length += MyMuscleState.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cpg_to_cdp1/MyMuscleStates';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68a8a94a76f8e57fa8ecb44dba7bb6da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MyMuscleStates(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.muscles !== undefined) {
      resolved.muscles = new Array(msg.muscles.length);
      for (let i = 0; i < resolved.muscles.length; ++i) {
        resolved.muscles[i] = MyMuscleState.Resolve(msg.muscles[i]);
      }
    }
    else {
      resolved.muscles = []
    }

    return resolved;
    }
};

module.exports = MyMuscleStates;
