// Generated by gencpp from file autolabor_canbus_driver/CanBusServiceResponse.msg
// DO NOT EDIT!


#ifndef AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICERESPONSE_H
#define AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace autolabor_canbus_driver
{
template <class ContainerAllocator>
struct CanBusServiceResponse_
{
  typedef CanBusServiceResponse_<ContainerAllocator> Type;

  CanBusServiceResponse_()
    {
    }
  CanBusServiceResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct CanBusServiceResponse_

typedef ::autolabor_canbus_driver::CanBusServiceResponse_<std::allocator<void> > CanBusServiceResponse;

typedef boost::shared_ptr< ::autolabor_canbus_driver::CanBusServiceResponse > CanBusServiceResponsePtr;
typedef boost::shared_ptr< ::autolabor_canbus_driver::CanBusServiceResponse const> CanBusServiceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace autolabor_canbus_driver

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "autolabor_canbus_driver/CanBusServiceResponse";
  }

  static const char* value(const ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CanBusServiceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::autolabor_canbus_driver::CanBusServiceResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICERESPONSE_H
