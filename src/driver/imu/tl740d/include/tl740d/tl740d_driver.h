#ifndef PROJECT_TL740D_DRIVER_H
#define PROJECT_TL740D_DRIVER_H

#include <string>
#include <boost/asio.hpp>
#include <boost/asio/serial_port.hpp>
#include <boost/asio/buffer.hpp>

#include <boost/system/error_code.hpp>
#include <boost/system/system_error.hpp>
#include <boost/bind.hpp>
#include <boost/thread.hpp>

#include <ros/ros.h>

#include "sensor_msgs/Imu.h"

typedef boost::shared_ptr<boost::asio::serial_port> serial_port_ptr;
#define COEF_DEG_TO_RAD                   57.29578
#define g                                 9.8


namespace autolabor_driver {

    class RotationDriver {
    public:
        RotationDriver();

        ~RotationDriver();

        void run();

    private:
        bool init();

        void parse_msg();

        bool update_parse_data();

        void reset_parse_data();

        uint8_t get_and_check(bool need_check);

        void handle_parse_msg();

        inline std::string array_to_string(uint8_t *vp, size_t len) {
            std::stringstream ss;
            for (int i = 0; i < len; i++)
                ss << std::hex << std::setw(2) << std::setfill('0') << (int) vp[i] << " ";
            return ss.str();
        }

        inline int rion_to_int(uint8_t b0, uint8_t b1, uint8_t b2) {
            int flag = (((b0 >> 4) & 0x01) == 1) ? -1 : 1;
            int data = (b0 & 0x0f) * 10000 + (b1 >> 4) * 1000 + (b1 & 0x0f) * 100 + (b2 >> 4) * 10 + (b2 & 0x0f) * 1;
            return flag * data;
        }

    private:
        std::string port_name_;
        int baud_rate_, parse_rate_;

        boost::system::error_code ec_;
        boost::asio::io_service io_service_;
        serial_port_ptr port_;
        boost::mutex mutex_;

        size_t parse_start_index_, parse_end_index_, point_index_;
        uint8_t state_, length_, command_, check_sum_;
        std::vector<uint8_t> payload_;
        uint8_t receive_data_[256], parse_data_[512];

        ros::Publisher msg_pub_;
    };
}


#endif //PROJECT_TL740D_DRIVER_H
