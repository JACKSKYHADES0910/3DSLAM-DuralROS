
#include <tl740d/tl740d_driver.h>
#include <tf/transform_datatypes.h>

namespace autolabor_driver {

    RotationDriver::RotationDriver() : parse_start_index_(0), parse_end_index_(0), point_index_(0), state_(0), check_sum_(0) {

    }

    RotationDriver::~RotationDriver() {
        boost::mutex::scoped_lock look(mutex_);
        if (port_) {
            port_->cancel();
            port_->close();
            port_.reset();
        }
        io_service_.stop();
        io_service_.reset();
    }

    bool RotationDriver::init() {
        if (port_) {
            ROS_ERROR("error : port is already opened...");
            return false;
        }
        port_ = serial_port_ptr(new boost::asio::serial_port(io_service_));
        port_->open(port_name_, ec_);
        if (ec_) {
            ROS_INFO_STREAM("error : port_->open() failed...port_name=" << port_name_ << ", e=" << ec_.message().c_str());
            return false;
        }
        // option settings...
        port_->set_option(boost::asio::serial_port_base::baud_rate(static_cast<unsigned int>(baud_rate_)));
        port_->set_option(boost::asio::serial_port_base::character_size(8));
        port_->set_option(boost::asio::serial_port_base::stop_bits(boost::asio::serial_port_base::stop_bits::one));
        port_->set_option(boost::asio::serial_port_base::parity(boost::asio::serial_port_base::parity::none));
        port_->set_option(boost::asio::serial_port_base::flow_control(boost::asio::serial_port_base::flow_control::none));
        return true;
    }

    bool RotationDriver::update_parse_data() {
        size_t count = boost::asio::read(*port_.get(), boost::asio::buffer(receive_data_, 256), boost::asio::transfer_at_least(1), ec_);
        // ROS_DEBUG_STREAM("RECEIVE < " << array_to_string(receive_data_, count) << ">");
        if (count > 0) {
//            std::cout << parse_end_index_ << " " << parse_start_index_ << std::endl;
            size_t remain_byte_number = parse_end_index_ - parse_start_index_;
            if (remain_byte_number > 0) {
                uint8_t tmp_buffer[512];
                std::memcpy(tmp_buffer, parse_data_ + parse_start_index_, remain_byte_number);
                std::memcpy(tmp_buffer + remain_byte_number, receive_data_, count);
                std::memcpy(parse_data_, tmp_buffer, count + remain_byte_number);
            } else {
                std::memcpy(parse_data_, receive_data_, count);
            }
            point_index_ = point_index_ - parse_start_index_;
            parse_start_index_ = 0;
            parse_end_index_ = count + remain_byte_number;
            return true;
        } else {
            return false;
        }
    }

    void RotationDriver::reset_parse_data() {
        state_ = 0;
        length_ = 0;
        command_ = 0;
        payload_.clear();
        check_sum_ = 0;
    }

    uint8_t RotationDriver::get_and_check(bool need_check) {
        uint8_t b = parse_data_[point_index_++];
        if (need_check) {
            check_sum_ += b;
        }
        return b;
    }

    void RotationDriver::handle_parse_msg() {
        if (command_ == 0x84) {
            sensor_msgs::Imu msg;
            msg.header.frame_id = "imu_link";
            msg.header.stamp = ros::Time::now();

            msg.angular_velocity.z = rion_to_int(payload_[0], payload_[1], payload_[2]) / 100.0 / COEF_DEG_TO_RAD;
            msg.linear_acceleration.x = rion_to_int(payload_[3], payload_[4], payload_[5]) / 1000.0 * g;
            msg.orientation = tf::createQuaternionMsgFromYaw(rion_to_int(payload_[6], payload_[7], payload_[8]) / 100.0 / COEF_DEG_TO_RAD);

            std::cout << msg.angular_velocity.z << " " << msg.linear_acceleration.x << " " << tf::getYaw(msg.orientation) << std::endl;
            msg_pub_.publish(msg);
        } else {
            ROS_INFO_STREAM("Temporarily do not support multi-frame data.");
        }
    }

    void RotationDriver::parse_msg() {
        ros::Rate loop_rate(parse_rate_);
        while (true) {
            bool continue_flag = true;
            bool update_flag = update_parse_data();
            while (point_index_ < parse_end_index_ && continue_flag) {
                switch (state_) {
                    case 0: { // header
                        reset_parse_data();
                        uint8_t header = get_and_check(false);
                        if (header == 0x68) {
                            state_ = 1;
                        } else {
                            point_index_ = ++parse_start_index_;
                            state_ = 0;
                        }
                        break;
                    }
                    case 1: { // length
                        length_ = get_and_check(true);
                        state_ = 2;
                        break;
                    }
                    case 2: { // address
                        get_and_check(true);
                        state_ = 3;
                        break;
                    }
                    case 3: { // command
                        command_ = get_and_check(true);
                        state_ = 4;
                        if (parse_end_index_ - point_index_ < (length_ - 4)) {
                            continue_flag = false;
                        }
                        break;
                    }
                    case 4: { // payload
                        for (int i = 0; i < (length_ - 4); i++) {
                            payload_.push_back(get_and_check(true));
                        }
                        state_ = 5;
                        break;
                    }
                    case 5: { // check_sum
                        uint8_t msg_check = get_and_check(false);
                        if (msg_check == check_sum_) {
                            handle_parse_msg();
                            parse_start_index_ = point_index_;
                        } else {
                            point_index_ = ++parse_start_index_;
                        }
                        state_ = 0;
                        break;
                    }
                    default: {
                        break;
                    }
                }
            }
            if (!update_flag) {
                loop_rate.sleep();
            }
        }
    }

    void RotationDriver::run() {
        ros::NodeHandle node;
        ros::NodeHandle private_node("~");

        private_node.param<std::string>("port_name", port_name_, std::string("/dev/ttyUSB0"));
        private_node.param<int>("baud_rate", baud_rate_, 115200);
        private_node.param<int>("parse_rate", parse_rate_, 1000);

        if (init()) {
            msg_pub_ = node.advertise<sensor_msgs::Imu>("rotation_msg", 10);
            boost::thread parse_thread(boost::bind(&RotationDriver::parse_msg, this));
        }
        ros::spin();
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "tl740d_driver");
    autolabor_driver::RotationDriver driver;
    driver.run();
    return 0;
}
