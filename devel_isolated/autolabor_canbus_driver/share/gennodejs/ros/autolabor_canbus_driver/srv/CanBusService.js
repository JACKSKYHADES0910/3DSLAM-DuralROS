// Auto-generated. Do not edit!

// (in-package autolabor_canbus_driver.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CanBusMessage = require('../msg/CanBusMessage.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CanBusServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.requests = null;
    }
    else {
      if (initObj.hasOwnProperty('requests')) {
        this.requests = initObj.requests
      }
      else {
        this.requests = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CanBusServiceRequest
    // Serialize message field [requests]
    // Serialize the length for message field [requests]
    bufferOffset = _serializer.uint32(obj.requests.length, buffer, bufferOffset);
    obj.requests.forEach((val) => {
      bufferOffset = CanBusMessage.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CanBusServiceRequest
    let len;
    let data = new CanBusServiceRequest(null);
    // Deserialize message field [requests]
    // Deserialize array length for message field [requests]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.requests = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.requests[i] = CanBusMessage.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.requests.forEach((val) => {
      length += CanBusMessage.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_canbus_driver/CanBusServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9a9cc9390520695f9967803f5179d063';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    autolabor_canbus_driver/CanBusMessage[] requests
    
    ================================================================================
    MSG: autolabor_canbus_driver/CanBusMessage
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
    const resolved = new CanBusServiceRequest(null);
    if (msg.requests !== undefined) {
      resolved.requests = new Array(msg.requests.length);
      for (let i = 0; i < resolved.requests.length; ++i) {
        resolved.requests[i] = CanBusMessage.Resolve(msg.requests[i]);
      }
    }
    else {
      resolved.requests = []
    }

    return resolved;
    }
};

class CanBusServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CanBusServiceResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CanBusServiceResponse
    let len;
    let data = new CanBusServiceResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_canbus_driver/CanBusServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CanBusServiceResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: CanBusServiceRequest,
  Response: CanBusServiceResponse,
  md5sum() { return '9a9cc9390520695f9967803f5179d063'; },
  datatype() { return 'autolabor_canbus_driver/CanBusService'; }
};
