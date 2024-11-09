// Auto-generated. Do not edit!

// (in-package urg_node.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.operating_mode = null;
      this.area_number = null;
      this.error_status = null;
      this.error_code = null;
      this.lockout_status = null;
      this.distance = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('operating_mode')) {
        this.operating_mode = initObj.operating_mode
      }
      else {
        this.operating_mode = 0;
      }
      if (initObj.hasOwnProperty('area_number')) {
        this.area_number = initObj.area_number
      }
      else {
        this.area_number = 0;
      }
      if (initObj.hasOwnProperty('error_status')) {
        this.error_status = initObj.error_status
      }
      else {
        this.error_status = false;
      }
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = 0;
      }
      if (initObj.hasOwnProperty('lockout_status')) {
        this.lockout_status = initObj.lockout_status
      }
      else {
        this.lockout_status = false;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Status
    // Serialize message field [operating_mode]
    bufferOffset = _serializer.uint16(obj.operating_mode, buffer, bufferOffset);
    // Serialize message field [area_number]
    bufferOffset = _serializer.uint16(obj.area_number, buffer, bufferOffset);
    // Serialize message field [error_status]
    bufferOffset = _serializer.bool(obj.error_status, buffer, bufferOffset);
    // Serialize message field [error_code]
    bufferOffset = _serializer.uint16(obj.error_code, buffer, bufferOffset);
    // Serialize message field [lockout_status]
    bufferOffset = _serializer.bool(obj.lockout_status, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.uint16(obj.distance, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float32(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Status
    let len;
    let data = new Status(null);
    // Deserialize message field [operating_mode]
    data.operating_mode = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [area_number]
    data.area_number = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [error_status]
    data.error_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error_code]
    data.error_code = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [lockout_status]
    data.lockout_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'urg_node/Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b393072b65230b373302bfe803e80784';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Normal vs setting in the UAM manual.
    uint16 NORMAL=0
    uint16 SETTING=1
    uint16 operating_mode
    
    # The configured area number the stop occurred in.
    uint16 area_number
    # If the laser is reporting an error or not.
    bool error_status
    # The error code the laser is reporting.
    uint16 error_code
    # Does the laser report that it is locked out.
    bool lockout_status
    # Distance in mm the stop was reported at.
    uint16 distance
    # The reported angle of the stop in deg.
    float32 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Status(null);
    if (msg.operating_mode !== undefined) {
      resolved.operating_mode = msg.operating_mode;
    }
    else {
      resolved.operating_mode = 0
    }

    if (msg.area_number !== undefined) {
      resolved.area_number = msg.area_number;
    }
    else {
      resolved.area_number = 0
    }

    if (msg.error_status !== undefined) {
      resolved.error_status = msg.error_status;
    }
    else {
      resolved.error_status = false
    }

    if (msg.error_code !== undefined) {
      resolved.error_code = msg.error_code;
    }
    else {
      resolved.error_code = 0
    }

    if (msg.lockout_status !== undefined) {
      resolved.lockout_status = msg.lockout_status;
    }
    else {
      resolved.lockout_status = false
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

// Constants for message
Status.Constants = {
  NORMAL: 0,
  SETTING: 1,
}

module.exports = Status;
