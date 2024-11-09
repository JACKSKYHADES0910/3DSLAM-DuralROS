// Auto-generated. Do not edit!

// (in-package ch104m.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Imu_data_package {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tag = null;
      this.bitmap = null;
      this.id = null;
      this.prs = null;
      this.time = null;
      this.frame_rate = null;
      this.acc_x = null;
      this.acc_y = null;
      this.acc_z = null;
      this.gyr_x = null;
      this.gyr_y = null;
      this.gyr_z = null;
      this.mag_x = null;
      this.mag_y = null;
      this.mag_z = null;
      this.eul_r = null;
      this.eul_p = null;
      this.eul_y = null;
      this.quat_w = null;
      this.quat_x = null;
      this.quat_y = null;
      this.quat_z = null;
    }
    else {
      if (initObj.hasOwnProperty('tag')) {
        this.tag = initObj.tag
      }
      else {
        this.tag = 0;
      }
      if (initObj.hasOwnProperty('bitmap')) {
        this.bitmap = initObj.bitmap
      }
      else {
        this.bitmap = 0;
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('prs')) {
        this.prs = initObj.prs
      }
      else {
        this.prs = 0.0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0;
      }
      if (initObj.hasOwnProperty('frame_rate')) {
        this.frame_rate = initObj.frame_rate
      }
      else {
        this.frame_rate = 0;
      }
      if (initObj.hasOwnProperty('acc_x')) {
        this.acc_x = initObj.acc_x
      }
      else {
        this.acc_x = 0.0;
      }
      if (initObj.hasOwnProperty('acc_y')) {
        this.acc_y = initObj.acc_y
      }
      else {
        this.acc_y = 0.0;
      }
      if (initObj.hasOwnProperty('acc_z')) {
        this.acc_z = initObj.acc_z
      }
      else {
        this.acc_z = 0.0;
      }
      if (initObj.hasOwnProperty('gyr_x')) {
        this.gyr_x = initObj.gyr_x
      }
      else {
        this.gyr_x = 0.0;
      }
      if (initObj.hasOwnProperty('gyr_y')) {
        this.gyr_y = initObj.gyr_y
      }
      else {
        this.gyr_y = 0.0;
      }
      if (initObj.hasOwnProperty('gyr_z')) {
        this.gyr_z = initObj.gyr_z
      }
      else {
        this.gyr_z = 0.0;
      }
      if (initObj.hasOwnProperty('mag_x')) {
        this.mag_x = initObj.mag_x
      }
      else {
        this.mag_x = 0.0;
      }
      if (initObj.hasOwnProperty('mag_y')) {
        this.mag_y = initObj.mag_y
      }
      else {
        this.mag_y = 0.0;
      }
      if (initObj.hasOwnProperty('mag_z')) {
        this.mag_z = initObj.mag_z
      }
      else {
        this.mag_z = 0.0;
      }
      if (initObj.hasOwnProperty('eul_r')) {
        this.eul_r = initObj.eul_r
      }
      else {
        this.eul_r = 0.0;
      }
      if (initObj.hasOwnProperty('eul_p')) {
        this.eul_p = initObj.eul_p
      }
      else {
        this.eul_p = 0.0;
      }
      if (initObj.hasOwnProperty('eul_y')) {
        this.eul_y = initObj.eul_y
      }
      else {
        this.eul_y = 0.0;
      }
      if (initObj.hasOwnProperty('quat_w')) {
        this.quat_w = initObj.quat_w
      }
      else {
        this.quat_w = 0.0;
      }
      if (initObj.hasOwnProperty('quat_x')) {
        this.quat_x = initObj.quat_x
      }
      else {
        this.quat_x = 0.0;
      }
      if (initObj.hasOwnProperty('quat_y')) {
        this.quat_y = initObj.quat_y
      }
      else {
        this.quat_y = 0.0;
      }
      if (initObj.hasOwnProperty('quat_z')) {
        this.quat_z = initObj.quat_z
      }
      else {
        this.quat_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Imu_data_package
    // Serialize message field [tag]
    bufferOffset = _serializer.uint8(obj.tag, buffer, bufferOffset);
    // Serialize message field [bitmap]
    bufferOffset = _serializer.uint8(obj.bitmap, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [prs]
    bufferOffset = _serializer.float32(obj.prs, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.uint32(obj.time, buffer, bufferOffset);
    // Serialize message field [frame_rate]
    bufferOffset = _serializer.uint32(obj.frame_rate, buffer, bufferOffset);
    // Serialize message field [acc_x]
    bufferOffset = _serializer.float32(obj.acc_x, buffer, bufferOffset);
    // Serialize message field [acc_y]
    bufferOffset = _serializer.float32(obj.acc_y, buffer, bufferOffset);
    // Serialize message field [acc_z]
    bufferOffset = _serializer.float32(obj.acc_z, buffer, bufferOffset);
    // Serialize message field [gyr_x]
    bufferOffset = _serializer.float32(obj.gyr_x, buffer, bufferOffset);
    // Serialize message field [gyr_y]
    bufferOffset = _serializer.float32(obj.gyr_y, buffer, bufferOffset);
    // Serialize message field [gyr_z]
    bufferOffset = _serializer.float32(obj.gyr_z, buffer, bufferOffset);
    // Serialize message field [mag_x]
    bufferOffset = _serializer.float32(obj.mag_x, buffer, bufferOffset);
    // Serialize message field [mag_y]
    bufferOffset = _serializer.float32(obj.mag_y, buffer, bufferOffset);
    // Serialize message field [mag_z]
    bufferOffset = _serializer.float32(obj.mag_z, buffer, bufferOffset);
    // Serialize message field [eul_r]
    bufferOffset = _serializer.float32(obj.eul_r, buffer, bufferOffset);
    // Serialize message field [eul_p]
    bufferOffset = _serializer.float32(obj.eul_p, buffer, bufferOffset);
    // Serialize message field [eul_y]
    bufferOffset = _serializer.float32(obj.eul_y, buffer, bufferOffset);
    // Serialize message field [quat_w]
    bufferOffset = _serializer.float32(obj.quat_w, buffer, bufferOffset);
    // Serialize message field [quat_x]
    bufferOffset = _serializer.float32(obj.quat_x, buffer, bufferOffset);
    // Serialize message field [quat_y]
    bufferOffset = _serializer.float32(obj.quat_y, buffer, bufferOffset);
    // Serialize message field [quat_z]
    bufferOffset = _serializer.float32(obj.quat_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Imu_data_package
    let len;
    let data = new Imu_data_package(null);
    // Deserialize message field [tag]
    data.tag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [bitmap]
    data.bitmap = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [prs]
    data.prs = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [frame_rate]
    data.frame_rate = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [acc_x]
    data.acc_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_y]
    data.acc_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_z]
    data.acc_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyr_x]
    data.gyr_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyr_y]
    data.gyr_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyr_z]
    data.gyr_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mag_x]
    data.mag_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mag_y]
    data.mag_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mag_z]
    data.mag_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eul_r]
    data.eul_r = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eul_p]
    data.eul_p = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [eul_y]
    data.eul_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [quat_w]
    data.quat_w = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [quat_x]
    data.quat_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [quat_y]
    data.quat_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [quat_z]
    data.quat_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 79;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ch104m/Imu_data_package';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '282c5be5a2e43c668a2bbf282a34b55a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Imu_data_package(null);
    if (msg.tag !== undefined) {
      resolved.tag = msg.tag;
    }
    else {
      resolved.tag = 0
    }

    if (msg.bitmap !== undefined) {
      resolved.bitmap = msg.bitmap;
    }
    else {
      resolved.bitmap = 0
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.prs !== undefined) {
      resolved.prs = msg.prs;
    }
    else {
      resolved.prs = 0.0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0
    }

    if (msg.frame_rate !== undefined) {
      resolved.frame_rate = msg.frame_rate;
    }
    else {
      resolved.frame_rate = 0
    }

    if (msg.acc_x !== undefined) {
      resolved.acc_x = msg.acc_x;
    }
    else {
      resolved.acc_x = 0.0
    }

    if (msg.acc_y !== undefined) {
      resolved.acc_y = msg.acc_y;
    }
    else {
      resolved.acc_y = 0.0
    }

    if (msg.acc_z !== undefined) {
      resolved.acc_z = msg.acc_z;
    }
    else {
      resolved.acc_z = 0.0
    }

    if (msg.gyr_x !== undefined) {
      resolved.gyr_x = msg.gyr_x;
    }
    else {
      resolved.gyr_x = 0.0
    }

    if (msg.gyr_y !== undefined) {
      resolved.gyr_y = msg.gyr_y;
    }
    else {
      resolved.gyr_y = 0.0
    }

    if (msg.gyr_z !== undefined) {
      resolved.gyr_z = msg.gyr_z;
    }
    else {
      resolved.gyr_z = 0.0
    }

    if (msg.mag_x !== undefined) {
      resolved.mag_x = msg.mag_x;
    }
    else {
      resolved.mag_x = 0.0
    }

    if (msg.mag_y !== undefined) {
      resolved.mag_y = msg.mag_y;
    }
    else {
      resolved.mag_y = 0.0
    }

    if (msg.mag_z !== undefined) {
      resolved.mag_z = msg.mag_z;
    }
    else {
      resolved.mag_z = 0.0
    }

    if (msg.eul_r !== undefined) {
      resolved.eul_r = msg.eul_r;
    }
    else {
      resolved.eul_r = 0.0
    }

    if (msg.eul_p !== undefined) {
      resolved.eul_p = msg.eul_p;
    }
    else {
      resolved.eul_p = 0.0
    }

    if (msg.eul_y !== undefined) {
      resolved.eul_y = msg.eul_y;
    }
    else {
      resolved.eul_y = 0.0
    }

    if (msg.quat_w !== undefined) {
      resolved.quat_w = msg.quat_w;
    }
    else {
      resolved.quat_w = 0.0
    }

    if (msg.quat_x !== undefined) {
      resolved.quat_x = msg.quat_x;
    }
    else {
      resolved.quat_x = 0.0
    }

    if (msg.quat_y !== undefined) {
      resolved.quat_y = msg.quat_y;
    }
    else {
      resolved.quat_y = 0.0
    }

    if (msg.quat_z !== undefined) {
      resolved.quat_z = msg.quat_z;
    }
    else {
      resolved.quat_z = 0.0
    }

    return resolved;
    }
};

module.exports = Imu_data_package;
