// Auto-generated. Do not edit!

// (in-package autolabor_canbus_driver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CanBusMessage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node_type = null;
      this.node_seq = null;
      this.msg_type = null;
      this.payload = null;
    }
    else {
      if (initObj.hasOwnProperty('node_type')) {
        this.node_type = initObj.node_type
      }
      else {
        this.node_type = 0;
      }
      if (initObj.hasOwnProperty('node_seq')) {
        this.node_seq = initObj.node_seq
      }
      else {
        this.node_seq = 0;
      }
      if (initObj.hasOwnProperty('msg_type')) {
        this.msg_type = initObj.msg_type
      }
      else {
        this.msg_type = 0;
      }
      if (initObj.hasOwnProperty('payload')) {
        this.payload = initObj.payload
      }
      else {
        this.payload = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CanBusMessage
    // Serialize message field [node_type]
    bufferOffset = _serializer.uint8(obj.node_type, buffer, bufferOffset);
    // Serialize message field [node_seq]
    bufferOffset = _serializer.uint8(obj.node_seq, buffer, bufferOffset);
    // Serialize message field [msg_type]
    bufferOffset = _serializer.uint8(obj.msg_type, buffer, bufferOffset);
    // Serialize message field [payload]
    bufferOffset = _arraySerializer.uint8(obj.payload, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CanBusMessage
    let len;
    let data = new CanBusMessage(null);
    // Deserialize message field [node_type]
    data.node_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [node_seq]
    data.node_seq = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [msg_type]
    data.msg_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [payload]
    data.payload = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.payload.length;
    return length + 7;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autolabor_canbus_driver/CanBusMessage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4fc00d85252b3621e3f37dfe24254deb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 node_type
    uint8 node_seq
    uint8 msg_type
    uint8[] payload
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CanBusMessage(null);
    if (msg.node_type !== undefined) {
      resolved.node_type = msg.node_type;
    }
    else {
      resolved.node_type = 0
    }

    if (msg.node_seq !== undefined) {
      resolved.node_seq = msg.node_seq;
    }
    else {
      resolved.node_seq = 0
    }

    if (msg.msg_type !== undefined) {
      resolved.msg_type = msg.msg_type;
    }
    else {
      resolved.msg_type = 0
    }

    if (msg.payload !== undefined) {
      resolved.payload = msg.payload;
    }
    else {
      resolved.payload = []
    }

    return resolved;
    }
};

module.exports = CanBusMessage;
