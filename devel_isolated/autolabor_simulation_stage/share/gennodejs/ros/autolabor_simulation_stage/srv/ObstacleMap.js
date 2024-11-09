// Auto-generated. Do not edit!

// (in-package autolabor_simulation_stage.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let nav_msgs = _finder('nav_msgs');

//-----------------------------------------------------------

class ObstacleMapRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ignore_obstacle_id = null;
    }
    else {
      if (initObj.hasOwnProperty('ignore_obstacle_id')) {
        this.ignore_obstacle_id = initObj.ignore_obstacle_id
      }
      else {
        this.ignore_obstacle_id = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleMapRequest
    // Serialize message field [ignore_obstacle_id]
    bufferOffset = _arraySerializer.string(obj.ignore_obstacle_id, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleMapRequest
    let len;
    let data = new ObstacleMapRequest(null);
    // Deserialize message field [ignore_obstacle_id]
    data.ignore_obstacle_id = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.ignore_obstacle_id.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_simulation_stage/ObstacleMapRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '56f5b1346c17daa6f8802683495a7007';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] ignore_obstacle_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleMapRequest(null);
    if (msg.ignore_obstacle_id !== undefined) {
      resolved.ignore_obstacle_id = msg.ignore_obstacle_id;
    }
    else {
      resolved.ignore_obstacle_id = []
    }

    return resolved;
    }
};

class ObstacleMapResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obstacle_map = null;
    }
    else {
      if (initObj.hasOwnProperty('obstacle_map')) {
        this.obstacle_map = initObj.obstacle_map
      }
      else {
        this.obstacle_map = new nav_msgs.msg.OccupancyGrid();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleMapResponse
    // Serialize message field [obstacle_map]
    bufferOffset = nav_msgs.msg.OccupancyGrid.serialize(obj.obstacle_map, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleMapResponse
    let len;
    let data = new ObstacleMapResponse(null);
    // Deserialize message field [obstacle_map]
    data.obstacle_map = nav_msgs.msg.OccupancyGrid.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += nav_msgs.msg.OccupancyGrid.getMessageSize(object.obstacle_map);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'autolabor_simulation_stage/ObstacleMapResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f82372032c968bba9627480de409827a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    nav_msgs/OccupancyGrid obstacle_map
    
    ================================================================================
    MSG: nav_msgs/OccupancyGrid
    # This represents a 2-D grid map, in which each cell represents the probability of
    # occupancy.
    
    Header header 
    
    #MetaData for the map
    MapMetaData info
    
    # The map data, in row-major order, starting with (0,0).  Occupancy
    # probabilities are in the range [0,100].  Unknown is -1.
    int8[] data
    
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
    MSG: nav_msgs/MapMetaData
    # This hold basic information about the characterists of the OccupancyGrid
    
    # The time at which the map was loaded
    time map_load_time
    # The map resolution [m/cell]
    float32 resolution
    # Map width [cells]
    uint32 width
    # Map height [cells]
    uint32 height
    # The origin of the map [m, m, rad].  This is the real-world pose of the
    # cell (0,0) in the map.
    geometry_msgs/Pose origin
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleMapResponse(null);
    if (msg.obstacle_map !== undefined) {
      resolved.obstacle_map = nav_msgs.msg.OccupancyGrid.Resolve(msg.obstacle_map)
    }
    else {
      resolved.obstacle_map = new nav_msgs.msg.OccupancyGrid()
    }

    return resolved;
    }
};

module.exports = {
  Request: ObstacleMapRequest,
  Response: ObstacleMapResponse,
  md5sum() { return 'cb18b08a081674fbfa15ea3f0864a898'; },
  datatype() { return 'autolabor_simulation_stage/ObstacleMap'; }
};
