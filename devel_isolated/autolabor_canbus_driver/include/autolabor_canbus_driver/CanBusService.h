// Generated by gencpp from file autolabor_canbus_driver/CanBusService.msg
// DO NOT EDIT!


#ifndef AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICE_H
#define AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICE_H

#include <ros/service_traits.h>


#include <autolabor_canbus_driver/CanBusServiceRequest.h>
#include <autolabor_canbus_driver/CanBusServiceResponse.h>


namespace autolabor_canbus_driver
{

struct CanBusService
{

typedef CanBusServiceRequest Request;
typedef CanBusServiceResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct CanBusService
} // namespace autolabor_canbus_driver


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::autolabor_canbus_driver::CanBusService > {
  static const char* value()
  {
    return "9a9cc9390520695f9967803f5179d063";
  }

  static const char* value(const ::autolabor_canbus_driver::CanBusService&) { return value(); }
};

template<>
struct DataType< ::autolabor_canbus_driver::CanBusService > {
  static const char* value()
  {
    return "autolabor_canbus_driver/CanBusService";
  }

  static const char* value(const ::autolabor_canbus_driver::CanBusService&) { return value(); }
};


// service_traits::MD5Sum< ::autolabor_canbus_driver::CanBusServiceRequest> should match
// service_traits::MD5Sum< ::autolabor_canbus_driver::CanBusService >
template<>
struct MD5Sum< ::autolabor_canbus_driver::CanBusServiceRequest>
{
  static const char* value()
  {
    return MD5Sum< ::autolabor_canbus_driver::CanBusService >::value();
  }
  static const char* value(const ::autolabor_canbus_driver::CanBusServiceRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::autolabor_canbus_driver::CanBusServiceRequest> should match
// service_traits::DataType< ::autolabor_canbus_driver::CanBusService >
template<>
struct DataType< ::autolabor_canbus_driver::CanBusServiceRequest>
{
  static const char* value()
  {
    return DataType< ::autolabor_canbus_driver::CanBusService >::value();
  }
  static const char* value(const ::autolabor_canbus_driver::CanBusServiceRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::autolabor_canbus_driver::CanBusServiceResponse> should match
// service_traits::MD5Sum< ::autolabor_canbus_driver::CanBusService >
template<>
struct MD5Sum< ::autolabor_canbus_driver::CanBusServiceResponse>
{
  static const char* value()
  {
    return MD5Sum< ::autolabor_canbus_driver::CanBusService >::value();
  }
  static const char* value(const ::autolabor_canbus_driver::CanBusServiceResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::autolabor_canbus_driver::CanBusServiceResponse> should match
// service_traits::DataType< ::autolabor_canbus_driver::CanBusService >
template<>
struct DataType< ::autolabor_canbus_driver::CanBusServiceResponse>
{
  static const char* value()
  {
    return DataType< ::autolabor_canbus_driver::CanBusService >::value();
  }
  static const char* value(const ::autolabor_canbus_driver::CanBusServiceResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // AUTOLABOR_CANBUS_DRIVER_MESSAGE_CANBUSSERVICE_H
