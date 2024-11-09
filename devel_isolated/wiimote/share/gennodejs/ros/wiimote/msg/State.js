// Auto-generated. Do not edit!

// (in-package wiimote.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let IrSourceInfo = require('./IrSourceInfo.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.angular_velocity_zeroed = null;
      this.angular_velocity_raw = null;
      this.angular_velocity_covariance = null;
      this.linear_acceleration_zeroed = null;
      this.linear_acceleration_raw = null;
      this.linear_acceleration_covariance = null;
      this.nunchuk_acceleration_zeroed = null;
      this.nunchuk_acceleration_raw = null;
      this.nunchuk_joystick_zeroed = null;
      this.nunchuk_joystick_raw = null;
      this.buttons = null;
      this.nunchuk_buttons = null;
      this.LEDs = null;
      this.rumble = null;
      this.ir_tracking = null;
      this.raw_battery = null;
      this.percent_battery = null;
      this.zeroing_time = null;
      this.errors = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('angular_velocity_zeroed')) {
        this.angular_velocity_zeroed = initObj.angular_velocity_zeroed
      }
      else {
        this.angular_velocity_zeroed = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('angular_velocity_raw')) {
        this.angular_velocity_raw = initObj.angular_velocity_raw
      }
      else {
        this.angular_velocity_raw = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('angular_velocity_covariance')) {
        this.angular_velocity_covariance = initObj.angular_velocity_covariance
      }
      else {
        this.angular_velocity_covariance = new Array(9).fill(0);
      }
      if (initObj.hasOwnProperty('linear_acceleration_zeroed')) {
        this.linear_acceleration_zeroed = initObj.linear_acceleration_zeroed
      }
      else {
        this.linear_acceleration_zeroed = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('linear_acceleration_raw')) {
        this.linear_acceleration_raw = initObj.linear_acceleration_raw
      }
      else {
        this.linear_acceleration_raw = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('linear_acceleration_covariance')) {
        this.linear_acceleration_covariance = initObj.linear_acceleration_covariance
      }
      else {
        this.linear_acceleration_covariance = new Array(9).fill(0);
      }
      if (initObj.hasOwnProperty('nunchuk_acceleration_zeroed')) {
        this.nunchuk_acceleration_zeroed = initObj.nunchuk_acceleration_zeroed
      }
      else {
        this.nunchuk_acceleration_zeroed = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('nunchuk_acceleration_raw')) {
        this.nunchuk_acceleration_raw = initObj.nunchuk_acceleration_raw
      }
      else {
        this.nunchuk_acceleration_raw = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('nunchuk_joystick_zeroed')) {
        this.nunchuk_joystick_zeroed = initObj.nunchuk_joystick_zeroed
      }
      else {
        this.nunchuk_joystick_zeroed = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('nunchuk_joystick_raw')) {
        this.nunchuk_joystick_raw = initObj.nunchuk_joystick_raw
      }
      else {
        this.nunchuk_joystick_raw = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('buttons')) {
        this.buttons = initObj.buttons
      }
      else {
        this.buttons = new Array(11).fill(0);
      }
      if (initObj.hasOwnProperty('nunchuk_buttons')) {
        this.nunchuk_buttons = initObj.nunchuk_buttons
      }
      else {
        this.nunchuk_buttons = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('LEDs')) {
        this.LEDs = initObj.LEDs
      }
      else {
        this.LEDs = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('rumble')) {
        this.rumble = initObj.rumble
      }
      else {
        this.rumble = false;
      }
      if (initObj.hasOwnProperty('ir_tracking')) {
        this.ir_tracking = initObj.ir_tracking
      }
      else {
        this.ir_tracking = [];
      }
      if (initObj.hasOwnProperty('raw_battery')) {
        this.raw_battery = initObj.raw_battery
      }
      else {
        this.raw_battery = 0.0;
      }
      if (initObj.hasOwnProperty('percent_battery')) {
        this.percent_battery = initObj.percent_battery
      }
      else {
        this.percent_battery = 0.0;
      }
      if (initObj.hasOwnProperty('zeroing_time')) {
        this.zeroing_time = initObj.zeroing_time
      }
      else {
        this.zeroing_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('errors')) {
        this.errors = initObj.errors
      }
      else {
        this.errors = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type State
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [angular_velocity_zeroed]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.angular_velocity_zeroed, buffer, bufferOffset);
    // Serialize message field [angular_velocity_raw]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.angular_velocity_raw, buffer, bufferOffset);
    // Check that the constant length array field [angular_velocity_covariance] has the right length
    if (obj.angular_velocity_covariance.length !== 9) {
      throw new Error('Unable to serialize array field angular_velocity_covariance - length must be 9')
    }
    // Serialize message field [angular_velocity_covariance]
    bufferOffset = _arraySerializer.float64(obj.angular_velocity_covariance, buffer, bufferOffset, 9);
    // Serialize message field [linear_acceleration_zeroed]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.linear_acceleration_zeroed, buffer, bufferOffset);
    // Serialize message field [linear_acceleration_raw]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.linear_acceleration_raw, buffer, bufferOffset);
    // Check that the constant length array field [linear_acceleration_covariance] has the right length
    if (obj.linear_acceleration_covariance.length !== 9) {
      throw new Error('Unable to serialize array field linear_acceleration_covariance - length must be 9')
    }
    // Serialize message field [linear_acceleration_covariance]
    bufferOffset = _arraySerializer.float64(obj.linear_acceleration_covariance, buffer, bufferOffset, 9);
    // Serialize message field [nunchuk_acceleration_zeroed]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.nunchuk_acceleration_zeroed, buffer, bufferOffset);
    // Serialize message field [nunchuk_acceleration_raw]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.nunchuk_acceleration_raw, buffer, bufferOffset);
    // Check that the constant length array field [nunchuk_joystick_zeroed] has the right length
    if (obj.nunchuk_joystick_zeroed.length !== 2) {
      throw new Error('Unable to serialize array field nunchuk_joystick_zeroed - length must be 2')
    }
    // Serialize message field [nunchuk_joystick_zeroed]
    bufferOffset = _arraySerializer.float32(obj.nunchuk_joystick_zeroed, buffer, bufferOffset, 2);
    // Check that the constant length array field [nunchuk_joystick_raw] has the right length
    if (obj.nunchuk_joystick_raw.length !== 2) {
      throw new Error('Unable to serialize array field nunchuk_joystick_raw - length must be 2')
    }
    // Serialize message field [nunchuk_joystick_raw]
    bufferOffset = _arraySerializer.float32(obj.nunchuk_joystick_raw, buffer, bufferOffset, 2);
    // Check that the constant length array field [buttons] has the right length
    if (obj.buttons.length !== 11) {
      throw new Error('Unable to serialize array field buttons - length must be 11')
    }
    // Serialize message field [buttons]
    bufferOffset = _arraySerializer.bool(obj.buttons, buffer, bufferOffset, 11);
    // Check that the constant length array field [nunchuk_buttons] has the right length
    if (obj.nunchuk_buttons.length !== 2) {
      throw new Error('Unable to serialize array field nunchuk_buttons - length must be 2')
    }
    // Serialize message field [nunchuk_buttons]
    bufferOffset = _arraySerializer.bool(obj.nunchuk_buttons, buffer, bufferOffset, 2);
    // Check that the constant length array field [LEDs] has the right length
    if (obj.LEDs.length !== 4) {
      throw new Error('Unable to serialize array field LEDs - length must be 4')
    }
    // Serialize message field [LEDs]
    bufferOffset = _arraySerializer.bool(obj.LEDs, buffer, bufferOffset, 4);
    // Serialize message field [rumble]
    bufferOffset = _serializer.bool(obj.rumble, buffer, bufferOffset);
    // Serialize message field [ir_tracking]
    // Serialize the length for message field [ir_tracking]
    bufferOffset = _serializer.uint32(obj.ir_tracking.length, buffer, bufferOffset);
    obj.ir_tracking.forEach((val) => {
      bufferOffset = IrSourceInfo.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [raw_battery]
    bufferOffset = _serializer.float32(obj.raw_battery, buffer, bufferOffset);
    // Serialize message field [percent_battery]
    bufferOffset = _serializer.float32(obj.percent_battery, buffer, bufferOffset);
    // Serialize message field [zeroing_time]
    bufferOffset = _serializer.time(obj.zeroing_time, buffer, bufferOffset);
    // Serialize message field [errors]
    bufferOffset = _serializer.uint64(obj.errors, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type State
    let len;
    let data = new State(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_zeroed]
    data.angular_velocity_zeroed = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_raw]
    data.angular_velocity_raw = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular_velocity_covariance]
    data.angular_velocity_covariance = _arrayDeserializer.float64(buffer, bufferOffset, 9)
    // Deserialize message field [linear_acceleration_zeroed]
    data.linear_acceleration_zeroed = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration_raw]
    data.linear_acceleration_raw = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration_covariance]
    data.linear_acceleration_covariance = _arrayDeserializer.float64(buffer, bufferOffset, 9)
    // Deserialize message field [nunchuk_acceleration_zeroed]
    data.nunchuk_acceleration_zeroed = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [nunchuk_acceleration_raw]
    data.nunchuk_acceleration_raw = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [nunchuk_joystick_zeroed]
    data.nunchuk_joystick_zeroed = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    // Deserialize message field [nunchuk_joystick_raw]
    data.nunchuk_joystick_raw = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    // Deserialize message field [buttons]
    data.buttons = _arrayDeserializer.bool(buffer, bufferOffset, 11)
    // Deserialize message field [nunchuk_buttons]
    data.nunchuk_buttons = _arrayDeserializer.bool(buffer, bufferOffset, 2)
    // Deserialize message field [LEDs]
    data.LEDs = _arrayDeserializer.bool(buffer, bufferOffset, 4)
    // Deserialize message field [rumble]
    data.rumble = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ir_tracking]
    // Deserialize array length for message field [ir_tracking]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ir_tracking = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ir_tracking[i] = IrSourceInfo.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [raw_battery]
    data.raw_battery = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [percent_battery]
    data.percent_battery = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zeroing_time]
    data.zeroing_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [errors]
    data.errors = _deserializer.uint64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 24 * object.ir_tracking.length;
    return length + 350;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wiimote/State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a69651e8129655c6ed3c5039e468362c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    #          Wiimote State message containing one complete Wiimote state
    
    # Note: For ease of manipulation this message often uses
    #       int8[] when a bit vector would work. One might
    #       wish to use uint8[], but then Python takes
    #       the respective structure as a string and disallows
    #       item assignment.
    
    int8    INVALID       = -1
    float32 INVALID_FLOAT = -1.0
    
    int8 MSG_BTN_1     = 0
    int8 MSG_BTN_2     = 1
    int8 MSG_BTN_A     = 2
    int8 MSG_BTN_B     = 3
    int8 MSG_BTN_PLUS  = 4
    int8 MSG_BTN_MINUS = 5
    int8 MSG_BTN_LEFT  = 6
    int8 MSG_BTN_RIGHT = 7
    int8 MSG_BTN_UP    = 8
    int8 MSG_BTN_DOWN  = 9
    int8 MSG_BTN_HOME  = 10
    int8 MSG_BTN_Z     = 0
    int8 MSG_BTN_C     = 1
    int8 MSG_CLASSIC_BTN_X       = 0
    int8 MSG_CLASSIC_BTN_Y       = 1
    int8 MSG_CLASSIC_BTN_A       = 2
    int8 MSG_CLASSIC_BTN_B       = 3
    int8 MSG_CLASSIC_BTN_PLUS    = 4
    int8 MSG_CLASSIC_BTN_MINUS   = 5
    int8 MSG_CLASSIC_BTN_LEFT    = 6
    int8 MSG_CLASSIC_BTN_RIGHT   = 7
    int8 MSG_CLASSIC_BTN_UP      = 8
    int8 MSG_CLASSIC_BTN_DOWN    = 9
    int8 MSG_CLASSIC_BTN_HOME    = 10
    int8 MSG_CLASSIC_BTN_L       = 11
    int8 MSG_CLASSIC_BTN_R       = 12
    int8 MSG_CLASSIC_BTN_ZL      = 13
    int8 MSG_CLASSIC_BTN_ZR      = 14
    
    #-----------------------------
    # Header
    #----------------------
    
    Header header
    
    #----------------------
    # Gyro reading
    #-----------------------------
    # In radians/sec. If reading is invalid,
    # for instance b/c no gyro is attached to the Wii, then
    # set first element of covariance to -1 (same as imu_data.msg):
    # Covariance matrix (roll, pitch, yaw) in radians^2/sec^2.
    
    geometry_msgs/Vector3 angular_velocity_zeroed
    geometry_msgs/Vector3 angular_velocity_raw
    float64[9] angular_velocity_covariance
    
    #----------------------
    # Accelerometer reading
    #-----------------------------
    # Acceleration in m/sec^2. Covariance matrix
    # (x,y,z) in m^2/sec^4.  (all same as imu_data.msg)
    
    geometry_msgs/Vector3 linear_acceleration_zeroed
    geometry_msgs/Vector3 linear_acceleration_raw
    float64[9] linear_acceleration_covariance
    
    #------------------------------
    # Nunchuk Accelerometer reading
    #------------------------------
    geometry_msgs/Vector3 nunchuk_acceleration_zeroed
    geometry_msgs/Vector3 nunchuk_acceleration_raw
    
    #-----------------
    # Nunchuk Joystick
    #-----------------
    float32[2] nunchuk_joystick_zeroed
    float32[2] nunchuk_joystick_raw
    
    #----------------------
    # Wiimote buttons
    #-----------------------------
    # Mappings from Wiimote button name
    # to array position are defined above.
    #
    bool[11] buttons
    bool[2] nunchuk_buttons
    
    #----------------------
    # Wiimote LED states:
    #-----------------------------
    
    bool[4] LEDs
    
    #----------------------
    # Wiimote Rumble
    #-----------------------------
    # State (True or False)
    
    bool rumble
    
    #----------------------
    # IR Light sensor (Camera)
    #-----------------------------
    # The Wiimote handles up to four light sources, 
    # and the wiimote_node.py software is written to 
    # that limit as well. For future expansion
    # we make the following array extensible, rather
    # than locking its length down to four:
    
    wiimote/IrSourceInfo[] ir_tracking
    
    #----------------------
    # Wiimote battery
    #-----------------------------
    # A battery reading consists of two numbers: 
    # the battery percentage, and the raw reading.
    # Maximum battery is 208 units (unknown how this
    # relates to electrical properties): 
    
    float32 raw_battery
    float32 percent_battery
    
    #----------------------
    # Time of most recent zeroing:
    #-----------------------------
    
    time zeroing_time
    
    #----------------------
    # Error vector
    #-----------------------------
    # For error condition definitions see wiimoteConstants.py
    # Value of zero means all is well. (Currently NOT used).
    
    uint64 errors
    
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
    ================================================================================
    MSG: wiimote/IrSourceInfo
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
    const resolved = new State(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.angular_velocity_zeroed !== undefined) {
      resolved.angular_velocity_zeroed = geometry_msgs.msg.Vector3.Resolve(msg.angular_velocity_zeroed)
    }
    else {
      resolved.angular_velocity_zeroed = new geometry_msgs.msg.Vector3()
    }

    if (msg.angular_velocity_raw !== undefined) {
      resolved.angular_velocity_raw = geometry_msgs.msg.Vector3.Resolve(msg.angular_velocity_raw)
    }
    else {
      resolved.angular_velocity_raw = new geometry_msgs.msg.Vector3()
    }

    if (msg.angular_velocity_covariance !== undefined) {
      resolved.angular_velocity_covariance = msg.angular_velocity_covariance;
    }
    else {
      resolved.angular_velocity_covariance = new Array(9).fill(0)
    }

    if (msg.linear_acceleration_zeroed !== undefined) {
      resolved.linear_acceleration_zeroed = geometry_msgs.msg.Vector3.Resolve(msg.linear_acceleration_zeroed)
    }
    else {
      resolved.linear_acceleration_zeroed = new geometry_msgs.msg.Vector3()
    }

    if (msg.linear_acceleration_raw !== undefined) {
      resolved.linear_acceleration_raw = geometry_msgs.msg.Vector3.Resolve(msg.linear_acceleration_raw)
    }
    else {
      resolved.linear_acceleration_raw = new geometry_msgs.msg.Vector3()
    }

    if (msg.linear_acceleration_covariance !== undefined) {
      resolved.linear_acceleration_covariance = msg.linear_acceleration_covariance;
    }
    else {
      resolved.linear_acceleration_covariance = new Array(9).fill(0)
    }

    if (msg.nunchuk_acceleration_zeroed !== undefined) {
      resolved.nunchuk_acceleration_zeroed = geometry_msgs.msg.Vector3.Resolve(msg.nunchuk_acceleration_zeroed)
    }
    else {
      resolved.nunchuk_acceleration_zeroed = new geometry_msgs.msg.Vector3()
    }

    if (msg.nunchuk_acceleration_raw !== undefined) {
      resolved.nunchuk_acceleration_raw = geometry_msgs.msg.Vector3.Resolve(msg.nunchuk_acceleration_raw)
    }
    else {
      resolved.nunchuk_acceleration_raw = new geometry_msgs.msg.Vector3()
    }

    if (msg.nunchuk_joystick_zeroed !== undefined) {
      resolved.nunchuk_joystick_zeroed = msg.nunchuk_joystick_zeroed;
    }
    else {
      resolved.nunchuk_joystick_zeroed = new Array(2).fill(0)
    }

    if (msg.nunchuk_joystick_raw !== undefined) {
      resolved.nunchuk_joystick_raw = msg.nunchuk_joystick_raw;
    }
    else {
      resolved.nunchuk_joystick_raw = new Array(2).fill(0)
    }

    if (msg.buttons !== undefined) {
      resolved.buttons = msg.buttons;
    }
    else {
      resolved.buttons = new Array(11).fill(0)
    }

    if (msg.nunchuk_buttons !== undefined) {
      resolved.nunchuk_buttons = msg.nunchuk_buttons;
    }
    else {
      resolved.nunchuk_buttons = new Array(2).fill(0)
    }

    if (msg.LEDs !== undefined) {
      resolved.LEDs = msg.LEDs;
    }
    else {
      resolved.LEDs = new Array(4).fill(0)
    }

    if (msg.rumble !== undefined) {
      resolved.rumble = msg.rumble;
    }
    else {
      resolved.rumble = false
    }

    if (msg.ir_tracking !== undefined) {
      resolved.ir_tracking = new Array(msg.ir_tracking.length);
      for (let i = 0; i < resolved.ir_tracking.length; ++i) {
        resolved.ir_tracking[i] = IrSourceInfo.Resolve(msg.ir_tracking[i]);
      }
    }
    else {
      resolved.ir_tracking = []
    }

    if (msg.raw_battery !== undefined) {
      resolved.raw_battery = msg.raw_battery;
    }
    else {
      resolved.raw_battery = 0.0
    }

    if (msg.percent_battery !== undefined) {
      resolved.percent_battery = msg.percent_battery;
    }
    else {
      resolved.percent_battery = 0.0
    }

    if (msg.zeroing_time !== undefined) {
      resolved.zeroing_time = msg.zeroing_time;
    }
    else {
      resolved.zeroing_time = {secs: 0, nsecs: 0}
    }

    if (msg.errors !== undefined) {
      resolved.errors = msg.errors;
    }
    else {
      resolved.errors = 0
    }

    return resolved;
    }
};

// Constants for message
State.Constants = {
  INVALID: -1,
  INVALID_FLOAT: -1.0,
  MSG_BTN_1: 0,
  MSG_BTN_2: 1,
  MSG_BTN_A: 2,
  MSG_BTN_B: 3,
  MSG_BTN_PLUS: 4,
  MSG_BTN_MINUS: 5,
  MSG_BTN_LEFT: 6,
  MSG_BTN_RIGHT: 7,
  MSG_BTN_UP: 8,
  MSG_BTN_DOWN: 9,
  MSG_BTN_HOME: 10,
  MSG_BTN_Z: 0,
  MSG_BTN_C: 1,
  MSG_CLASSIC_BTN_X: 0,
  MSG_CLASSIC_BTN_Y: 1,
  MSG_CLASSIC_BTN_A: 2,
  MSG_CLASSIC_BTN_B: 3,
  MSG_CLASSIC_BTN_PLUS: 4,
  MSG_CLASSIC_BTN_MINUS: 5,
  MSG_CLASSIC_BTN_LEFT: 6,
  MSG_CLASSIC_BTN_RIGHT: 7,
  MSG_CLASSIC_BTN_UP: 8,
  MSG_CLASSIC_BTN_DOWN: 9,
  MSG_CLASSIC_BTN_HOME: 10,
  MSG_CLASSIC_BTN_L: 11,
  MSG_CLASSIC_BTN_R: 12,
  MSG_CLASSIC_BTN_ZL: 13,
  MSG_CLASSIC_BTN_ZR: 14,
}

module.exports = State;
