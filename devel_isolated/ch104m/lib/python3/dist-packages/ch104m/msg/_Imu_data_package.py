# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ch104m/Imu_data_package.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Imu_data_package(genpy.Message):
  _md5sum = "282c5be5a2e43c668a2bbf282a34b55a"
  _type = "ch104m/Imu_data_package"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 tag
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
"""
  __slots__ = ['tag','bitmap','id','prs','time','frame_rate','acc_x','acc_y','acc_z','gyr_x','gyr_y','gyr_z','mag_x','mag_y','mag_z','eul_r','eul_p','eul_y','quat_w','quat_x','quat_y','quat_z']
  _slot_types = ['uint8','uint8','uint8','float32','uint32','uint32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       tag,bitmap,id,prs,time,frame_rate,acc_x,acc_y,acc_z,gyr_x,gyr_y,gyr_z,mag_x,mag_y,mag_z,eul_r,eul_p,eul_y,quat_w,quat_x,quat_y,quat_z

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Imu_data_package, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.tag is None:
        self.tag = 0
      if self.bitmap is None:
        self.bitmap = 0
      if self.id is None:
        self.id = 0
      if self.prs is None:
        self.prs = 0.
      if self.time is None:
        self.time = 0
      if self.frame_rate is None:
        self.frame_rate = 0
      if self.acc_x is None:
        self.acc_x = 0.
      if self.acc_y is None:
        self.acc_y = 0.
      if self.acc_z is None:
        self.acc_z = 0.
      if self.gyr_x is None:
        self.gyr_x = 0.
      if self.gyr_y is None:
        self.gyr_y = 0.
      if self.gyr_z is None:
        self.gyr_z = 0.
      if self.mag_x is None:
        self.mag_x = 0.
      if self.mag_y is None:
        self.mag_y = 0.
      if self.mag_z is None:
        self.mag_z = 0.
      if self.eul_r is None:
        self.eul_r = 0.
      if self.eul_p is None:
        self.eul_p = 0.
      if self.eul_y is None:
        self.eul_y = 0.
      if self.quat_w is None:
        self.quat_w = 0.
      if self.quat_x is None:
        self.quat_x = 0.
      if self.quat_y is None:
        self.quat_y = 0.
      if self.quat_z is None:
        self.quat_z = 0.
    else:
      self.tag = 0
      self.bitmap = 0
      self.id = 0
      self.prs = 0.
      self.time = 0
      self.frame_rate = 0
      self.acc_x = 0.
      self.acc_y = 0.
      self.acc_z = 0.
      self.gyr_x = 0.
      self.gyr_y = 0.
      self.gyr_z = 0.
      self.mag_x = 0.
      self.mag_y = 0.
      self.mag_z = 0.
      self.eul_r = 0.
      self.eul_p = 0.
      self.eul_y = 0.
      self.quat_w = 0.
      self.quat_x = 0.
      self.quat_y = 0.
      self.quat_z = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3Bf2I16f().pack(_x.tag, _x.bitmap, _x.id, _x.prs, _x.time, _x.frame_rate, _x.acc_x, _x.acc_y, _x.acc_z, _x.gyr_x, _x.gyr_y, _x.gyr_z, _x.mag_x, _x.mag_y, _x.mag_z, _x.eul_r, _x.eul_p, _x.eul_y, _x.quat_w, _x.quat_x, _x.quat_y, _x.quat_z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 79
      (_x.tag, _x.bitmap, _x.id, _x.prs, _x.time, _x.frame_rate, _x.acc_x, _x.acc_y, _x.acc_z, _x.gyr_x, _x.gyr_y, _x.gyr_z, _x.mag_x, _x.mag_y, _x.mag_z, _x.eul_r, _x.eul_p, _x.eul_y, _x.quat_w, _x.quat_x, _x.quat_y, _x.quat_z,) = _get_struct_3Bf2I16f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3Bf2I16f().pack(_x.tag, _x.bitmap, _x.id, _x.prs, _x.time, _x.frame_rate, _x.acc_x, _x.acc_y, _x.acc_z, _x.gyr_x, _x.gyr_y, _x.gyr_z, _x.mag_x, _x.mag_y, _x.mag_z, _x.eul_r, _x.eul_p, _x.eul_y, _x.quat_w, _x.quat_x, _x.quat_y, _x.quat_z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 79
      (_x.tag, _x.bitmap, _x.id, _x.prs, _x.time, _x.frame_rate, _x.acc_x, _x.acc_y, _x.acc_z, _x.gyr_x, _x.gyr_y, _x.gyr_z, _x.mag_x, _x.mag_y, _x.mag_z, _x.eul_r, _x.eul_p, _x.eul_y, _x.quat_w, _x.quat_x, _x.quat_y, _x.quat_z,) = _get_struct_3Bf2I16f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3Bf2I16f = None
def _get_struct_3Bf2I16f():
    global _struct_3Bf2I16f
    if _struct_3Bf2I16f is None:
        _struct_3Bf2I16f = struct.Struct("<3Bf2I16f")
    return _struct_3Bf2I16f
