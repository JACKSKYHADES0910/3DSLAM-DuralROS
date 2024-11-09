// Auto-generated. Do not edit!

// (in-package autolabor_simulation_stage.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ObstacleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obstacle_id = null;
      this.type = null;
      this.transform = null;
      this.vertex = null;
    }
    else {
      if (initObj.hasOwnProperty('obstacle_id')) {
        this.obstacle_id = initObj.obstacle_id
      }
      else {
        this.obstacle_id = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('vertex')) {
        this.vertex = initObj.vertex
      }
      else {
        this.vertex = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleRequest
    // Serialize message field [obstacle_id]
    bufferOffset = _serializer.string(obj.obstacle_id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Check that the constant length array field [transform] has the right length
    if (obj.transform.length !== 3) {
      throw new Error('Unable to serialize array field transform - length must be 3')
    }
    // Serialize message field [transform]
    bufferOffset = _arraySerializer.float32(obj.transform, buffer, bufferOffset, 3);
    // Serialize message field [vertex]
    // Serialize the length for message field [vertex]
    bufferOffset = _serializer.uint32(obj.vertex.length, buffer, bufferOffset);
    obj.vertex.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Polygon.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleRequest
    let len;
    let data = new ObstacleRequest(null);
    // Deserialize message field [obstacle_id]
    data.obstacle_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [transform]
    data.transform = _arrayDeserializer.float32(buffer, bufferOffset, 3)
    // Deserialize message field [vertex]
    // Deserialize array length for message field [vertex]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vertex = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vertex[i] = geometry_msgs.msg.Polygon.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.obstacle_id);
    object.vertex.forEach((val) => {
      length += geometry_msgs.msg.Polygon.getMessageSize(val);
    });
    return length + 21;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_simulation_stage/ObstacleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '16784fb8acead2e3b4470fa59f07d999';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 NEW=0
    uint8 TRANSFORM=1
    uint8 DELETE=2
    
    string obstacle_id
    uint8 type
    float32[3] transform
    geometry_msgs/Polygon[] vertex
    
    ================================================================================
    MSG: geometry_msgs/Polygon
    #A specification of a polygon where the first and last points are assumed to be connected
    Point32[] points
    
    ================================================================================
    MSG: geometry_msgs/Point32
    # This contains the position of a point in free space(with 32 bits of precision).
    # It is recommeded to use Point wherever possible instead of Point32.  
    # 
    # This recommendation is to promote interoperability.  
    #
    # This message is designed to take up less space when sending
    # lots of points at once, as in the case of a PointCloud.  
    
    float32 x
    float32 y
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleRequest(null);
    if (msg.obstacle_id !== undefined) {
      resolved.obstacle_id = msg.obstacle_id;
    }
    else {
      resolved.obstacle_id = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.transform !== undefined) {
      resolved.transform = msg.transform;
    }
    else {
      resolved.transform = new Array(3).fill(0)
    }

    if (msg.vertex !== undefined) {
      resolved.vertex = new Array(msg.vertex.length);
      for (let i = 0; i < resolved.vertex.length; ++i) {
        resolved.vertex[i] = geometry_msgs.msg.Polygon.Resolve(msg.vertex[i]);
      }
    }
    else {
      resolved.vertex = []
    }

    return resolved;
    }
};

// Constants for message
ObstacleRequest.Constants = {
  NEW: 0,
  TRANSFORM: 1,
  DELETE: 2,
}

class ObstacleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleResponse
    let len;
    let data = new ObstacleResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_simulation_stage/ObstacleResponse';
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
    const resolved = new ObstacleResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: ObstacleRequest,
  Response: ObstacleResponse,
  md5sum() { return '16784fb8acead2e3b4470fa59f07d999'; },
  datatype() { return 'autolabor_simulation_stage/Obstacle'; }
};
