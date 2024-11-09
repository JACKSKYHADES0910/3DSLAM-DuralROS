// Auto-generated. Do not edit!

// (in-package ch104m.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Imu_data_package = require('./Imu_data_package.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Imu_0x91_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.imu_data = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('imu_data')) {
        this.imu_data = initObj.imu_data
      }
      else {
        this.imu_data = new Imu_data_package();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Imu_0x91_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [imu_data]
    bufferOffset = Imu_data_package.serialize(obj.imu_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Imu_0x91_msg
    let len;
    let data = new Imu_0x91_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [imu_data]
    data.imu_data = Imu_data_package.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 79;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ch104m/Imu_0x91_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf1a29bdfa7a4861f3dcfb7c14758970';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #90 91 data_package
    Header header
    Imu_data_package imu_data
    
    
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
    MSG: ch104m/Imu_data_package
    uint8 tag
    uint8 bitmap
    uint8 id
    float32 prs
    uint32 time
    uint32 frame_rate
    float32 acc_x
    float32 acc_y
    float32 acc_z
    float32 gyr_x
    float32 gyr_y
    float32 gyr_z
    float32 mag_x
    float32 mag_y
    float32 mag_z
    float32 eul_r
    float32 eul_p
    float32 eul_y
    float32 quat_w
    float32 quat_x
    float32 quat_y
    float32 quat_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Imu_0x91_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.imu_data !== undefined) {
      resolved.imu_data = Imu_data_package.Resolve(msg.imu_data)
    }
    else {
      resolved.imu_data = new Imu_data_package()
    }

    return resolved;
    }
};

module.exports = Imu_0x91_msg;
