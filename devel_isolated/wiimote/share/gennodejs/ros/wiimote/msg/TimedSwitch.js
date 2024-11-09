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

class TimedSwitch {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.switch_mode = null;
      this.num_cycles = null;
      this.pulse_pattern = null;
    }
    else {
      if (initObj.hasOwnProperty('switch_mode')) {
        this.switch_mode = initObj.switch_mode
      }
      else {
        this.switch_mode = 0;
      }
      if (initObj.hasOwnProperty('num_cycles')) {
        this.num_cycles = initObj.num_cycles
      }
      else {
        this.num_cycles = 0;
      }
      if (initObj.hasOwnProperty('pulse_pattern')) {
        this.pulse_pattern = initObj.pulse_pattern
      }
      else {
        this.pulse_pattern = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TimedSwitch
    // Serialize message field [switch_mode]
    bufferOffset = _serializer.int8(obj.switch_mode, buffer, bufferOffset);
    // Serialize message field [num_cycles]
    bufferOffset = _serializer.int32(obj.num_cycles, buffer, bufferOffset);
    // Serialize message field [pulse_pattern]
    bufferOffset = _arraySerializer.float32(obj.pulse_pattern, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TimedSwitch
    let len;
    let data = new TimedSwitch(null);
    // Deserialize message field [switch_mode]
    data.switch_mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [num_cycles]
    data.num_cycles = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pulse_pattern]
    data.pulse_pattern = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.pulse_pattern.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wiimote/TimedSwitch';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4c8d9327409cef6066fa6c368032c1e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # TimedSwitch allows sender to:
    #    o turn a switch on,
    #    o turn a switch off, and
    #    o repeat an on/off pattern forever or for a
    #          given number of times.
    # Fields (refer to definitions of constants in the definition body):
    #     o switch_mode:
    #         ON: turn on  (num_cycles and pulse_pattern fields are ignored)
    #        OFF: turn off (num_cycles and pulse_pattern fields are ignored)
    #  NO_CHANGE: leave LED in its current state
    #     REPEAT: repeat an on/off pattern for as long
    #             as is indicated in the num_cycles field. The
    #             pattern is defined in the pulse_pattern field.
    #
    #     o num_cycles:
    #          n>=0: run the pattern that is defined in pulse_pattern
    #                n times.
    #          n==FOREVER: run the pattern that is defined in pulse_pattern
    #                       until a new TimedSwitch message is sent.              
    #
    #     o pulse_pattern:
    #          A series of time durations in fractions of a second. The
    #          first number is the duration for having the switch on.
    #          The second number is the duration for which the switch
    #          is off. The third is an 'on' period again, etc.
    #          A pattern is terminated with the end of the array.
    #           
    #          Example: [1,1] specifies an on-off sequence of 1 second.               
    
    int8 ON        =  1
    int8 OFF       =  0
    int8 NO_CHANGE = -2
    int8 REPEAT    = -1
    int8 FOREVER   = -1
    
    int8 switch_mode
    int32 num_cycles
    float32[] pulse_pattern
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TimedSwitch(null);
    if (msg.switch_mode !== undefined) {
      resolved.switch_mode = msg.switch_mode;
    }
    else {
      resolved.switch_mode = 0
    }

    if (msg.num_cycles !== undefined) {
      resolved.num_cycles = msg.num_cycles;
    }
    else {
      resolved.num_cycles = 0
    }

    if (msg.pulse_pattern !== undefined) {
      resolved.pulse_pattern = msg.pulse_pattern;
    }
    else {
      resolved.pulse_pattern = []
    }

    return resolved;
    }
};

// Constants for message
TimedSwitch.Constants = {
  ON: 1,
  OFF: 0,
  NO_CHANGE: -2,
  REPEAT: -1,
  FOREVER: -1,
}

module.exports = TimedSwitch;
