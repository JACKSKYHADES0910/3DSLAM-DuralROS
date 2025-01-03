# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from autolabor_simulation_stage/ObstacleMapRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class ObstacleMapRequest(genpy.Message):
  _md5sum = "56f5b1346c17daa6f8802683495a7007"
  _type = "autolabor_simulation_stage/ObstacleMapRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """string[] ignore_obstacle_id
"""
  __slots__ = ['ignore_obstacle_id']
  _slot_types = ['string[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ignore_obstacle_id

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ObstacleMapRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.ignore_obstacle_id is None:
        self.ignore_obstacle_id = []
    else:
      self.ignore_obstacle_id = []

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
      length = len(self.ignore_obstacle_id)
      buff.write(_struct_I.pack(length))
      for val1 in self.ignore_obstacle_id:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
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
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.ignore_obstacle_id = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.ignore_obstacle_id.append(val1)
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
      length = len(self.ignore_obstacle_id)
      buff.write(_struct_I.pack(length))
      for val1 in self.ignore_obstacle_id:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.Struct('<I%ss'%length).pack(length, val1))
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
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.ignore_obstacle_id = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1 = str[start:end]
        self.ignore_obstacle_id.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from autolabor_simulation_stage/ObstacleMapResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import geometry_msgs.msg
import nav_msgs.msg
import std_msgs.msg

class ObstacleMapResponse(genpy.Message):
  _md5sum = "f82372032c968bba9627480de409827a"
  _type = "autolabor_simulation_stage/ObstacleMapResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """nav_msgs/OccupancyGrid obstacle_map

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
"""
  __slots__ = ['obstacle_map']
  _slot_types = ['nav_msgs/OccupancyGrid']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       obstacle_map

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ObstacleMapResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.obstacle_map is None:
        self.obstacle_map = nav_msgs.msg.OccupancyGrid()
    else:
      self.obstacle_map = nav_msgs.msg.OccupancyGrid()

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
      buff.write(_get_struct_3I().pack(_x.obstacle_map.header.seq, _x.obstacle_map.header.stamp.secs, _x.obstacle_map.header.stamp.nsecs))
      _x = self.obstacle_map.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2If2I7d().pack(_x.obstacle_map.info.map_load_time.secs, _x.obstacle_map.info.map_load_time.nsecs, _x.obstacle_map.info.resolution, _x.obstacle_map.info.width, _x.obstacle_map.info.height, _x.obstacle_map.info.origin.position.x, _x.obstacle_map.info.origin.position.y, _x.obstacle_map.info.origin.position.z, _x.obstacle_map.info.origin.orientation.x, _x.obstacle_map.info.origin.orientation.y, _x.obstacle_map.info.origin.orientation.z, _x.obstacle_map.info.origin.orientation.w))
      length = len(self.obstacle_map.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sb'%length
      buff.write(struct.Struct(pattern).pack(*self.obstacle_map.data))
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
      if self.obstacle_map is None:
        self.obstacle_map = nav_msgs.msg.OccupancyGrid()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.obstacle_map.header.seq, _x.obstacle_map.header.stamp.secs, _x.obstacle_map.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.obstacle_map.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.obstacle_map.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 76
      (_x.obstacle_map.info.map_load_time.secs, _x.obstacle_map.info.map_load_time.nsecs, _x.obstacle_map.info.resolution, _x.obstacle_map.info.width, _x.obstacle_map.info.height, _x.obstacle_map.info.origin.position.x, _x.obstacle_map.info.origin.position.y, _x.obstacle_map.info.origin.position.z, _x.obstacle_map.info.origin.orientation.x, _x.obstacle_map.info.origin.orientation.y, _x.obstacle_map.info.origin.orientation.z, _x.obstacle_map.info.origin.orientation.w,) = _get_struct_2If2I7d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sb'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.obstacle_map.data = s.unpack(str[start:end])
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
      buff.write(_get_struct_3I().pack(_x.obstacle_map.header.seq, _x.obstacle_map.header.stamp.secs, _x.obstacle_map.header.stamp.nsecs))
      _x = self.obstacle_map.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2If2I7d().pack(_x.obstacle_map.info.map_load_time.secs, _x.obstacle_map.info.map_load_time.nsecs, _x.obstacle_map.info.resolution, _x.obstacle_map.info.width, _x.obstacle_map.info.height, _x.obstacle_map.info.origin.position.x, _x.obstacle_map.info.origin.position.y, _x.obstacle_map.info.origin.position.z, _x.obstacle_map.info.origin.orientation.x, _x.obstacle_map.info.origin.orientation.y, _x.obstacle_map.info.origin.orientation.z, _x.obstacle_map.info.origin.orientation.w))
      length = len(self.obstacle_map.data)
      buff.write(_struct_I.pack(length))
      pattern = '<%sb'%length
      buff.write(self.obstacle_map.data.tostring())
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
      if self.obstacle_map is None:
        self.obstacle_map = nav_msgs.msg.OccupancyGrid()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.obstacle_map.header.seq, _x.obstacle_map.header.stamp.secs, _x.obstacle_map.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.obstacle_map.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.obstacle_map.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 76
      (_x.obstacle_map.info.map_load_time.secs, _x.obstacle_map.info.map_load_time.nsecs, _x.obstacle_map.info.resolution, _x.obstacle_map.info.width, _x.obstacle_map.info.height, _x.obstacle_map.info.origin.position.x, _x.obstacle_map.info.origin.position.y, _x.obstacle_map.info.origin.position.z, _x.obstacle_map.info.origin.orientation.x, _x.obstacle_map.info.origin.orientation.y, _x.obstacle_map.info.origin.orientation.z, _x.obstacle_map.info.origin.orientation.w,) = _get_struct_2If2I7d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sb'%length
      start = end
      s = struct.Struct(pattern)
      end += s.size
      self.obstacle_map.data = numpy.frombuffer(str[start:end], dtype=numpy.int8, count=length)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2If2I7d = None
def _get_struct_2If2I7d():
    global _struct_2If2I7d
    if _struct_2If2I7d is None:
        _struct_2If2I7d = struct.Struct("<2If2I7d")
    return _struct_2If2I7d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
class ObstacleMap(object):
  _type          = 'autolabor_simulation_stage/ObstacleMap'
  _md5sum = 'cb18b08a081674fbfa15ea3f0864a898'
  _request_class  = ObstacleMapRequest
  _response_class = ObstacleMapResponse
