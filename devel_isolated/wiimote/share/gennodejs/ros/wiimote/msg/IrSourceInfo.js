// Auto-generated. Do not edit!

// (in-package wiimote.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class IrSourceInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.ir_size = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('ir_size')) {
        this.ir_size = initObj.ir_size
      }
      else {
        this.ir_size = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IrSourceInfo
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [ir_size]
    bufferOffset = _serializer.int64(obj.ir_size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IrSourceInfo
    let len;
    let data = new IrSourceInfo(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ir_size]
    data.ir_size = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wiimote/IrSourceInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95274ca88b9f008b99984b9a61d2772e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Sensor data pertaining to the Wiimote infrared camera.
    # This message contains data for one of the four infrared 
    # light sources that the camera detects.
    #
    # Each light is specified with a 2D position and 
    # a 'source magnitude' (ir_size). If the x dimension
    # is set to INVALID_FLOAT, then no light was detected for 
    # the respective light. The Wiimote handles up to
    # four light sources, and the wiimote_node.py software
    # is written to that limit as well.
    #
    # I am unsure what the 'ir_size' values represent. 
    # They are described as 'source magnitude' in some places. I
    # *assume* this is signal amplitude, but it's unclear. 
    # Note that current lowest level cwiid driver does not 
    # seem to pass the ir_size value to the cwiid Wiimote.c. 
    # For now this size will therefore be set INVALID
    
    float64 x 
    float64 y 
    int64 ir_size
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IrSourceInfo(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.ir_size !== undefined) {
      resolved.ir_size = msg.ir_size;
    }
    else {
      resolved.ir_size = 0
    }

    return resolved;
    }
};

module.exports = IrSourceInfo;
