
#include <marvelmind/marvelmind_driver.h>

#include "marvelmind/marvelmind_driver.h"


namespace autolabor_driver {

    void message_received() {
        message_received_flag++;
    }

    MarvelmindDriver::MarvelmindDriver() {
        message_received_flag = false;
    }

    MarvelmindDriver::~MarvelmindDriver() {
        if (hedge_ != nullptr) {
            stopMarvelmindHedge(hedge_);
            destroyMarvelmindHedge(hedge_);
        }
    }

    bool MarvelmindDriver::init() {
        hedge_ = createMarvelmindHedge();
        if (hedge_ == nullptr) {
            ROS_INFO ("Error: Unable to create MarvelmindHedge");
            return false;
        }
        hedge_->ttyFileName = port_name_.c_str();
        hedge_->baudRate = static_cast<uint32_t>(baud_rate_);
        hedge_->verbose = true; // show errors and warnings
        hedge_->anyInputPacketCallback = message_received;
        startMarvelmindHedge(hedge_);
        return true;
    }

    bool MarvelmindDriver::hedge_receive_check() {
        if (hedge_->haveNewValues_) {
            struct PositionValue position{};
            getPositionFromMarvelmindHedge(hedge_, &position);

            point_stamped_.header.stamp.fromSec(position.timestamp / 1000.0);
            point_stamped_.header.frame_id = map_frame_;

            point_stamped_.point.x = position.x / 1000.0;
            point_stamped_.point.y = position.y / 1000.0;
            point_stamped_.point.z = position.z / 1000.0;

            hedge_->haveNewValues_ = false;
            return true;
        }
        return false;
    }

    bool MarvelmindDriver::beacon_receive_check() {
        uint8_t i;
        struct StationaryBeaconsPositions positions{};
        struct StationaryBeaconPosition *bp = nullptr;
        bool foundUpd = false;
        uint8_t n;

        getStationaryBeaconsPositionsFromMarvelmindHedge(hedge_, &positions);
        n = positions.numBeacons;
        if (n == 0) {
            return false;
        }

        for (i = 0; i < n; i++) {
            bp = &positions.beacons[i];
            if (bp->updatedForMsg) {
                clearStationaryBeaconUpdatedFlag(hedge_, bp->address);
                foundUpd = true;
                break;
            }
        }
        if (!foundUpd) {
            return false;
        }

        beacon_pos_msg_.address = bp->address;
        beacon_pos_msg_.x_m = bp->x / 1000.0;
        beacon_pos_msg_.y_m = bp->y / 1000.0;
        beacon_pos_msg_.z_m = bp->z / 1000.0;

        return true;
    }

    void MarvelmindDriver::publish_msg(const ros::TimerEvent &) {
        if (hedge_->terminationRequired) {
            publish_timer_.stop();
        }

        if (message_received_flag <= 0) {
            return;
        }

        if (hedge_receive_check()) {
            // hedgehog data received
            hedge_pos_publisher_.publish(point_stamped_);
        }

        int beacon_read_iterations = 0;
        while (beacon_receive_check()) {
            // stationary beacons data received
            beacons_pos_publisher_.publish(beacon_pos_msg_);
            if ((beacon_read_iterations++) > 4) {
                break;
            }
        }

        if (--message_received_flag < 0) {
            message_received_flag = 0;
        }
    }

    void MarvelmindDriver::run() {
        ros::NodeHandle node;
        ros::NodeHandle private_node("~");

        private_node.param<std::string>("map_frame", map_frame_, std::string("map"));

        private_node.param<std::string>("port_name", port_name_, std::string("/dev/ttyUSB0"));
        private_node.param<int>("baud_rate", baud_rate_, 9600);

        if (init()) {
            hedge_pos_publisher_ = node.advertise<geometry_msgs::PointStamped>("/marvelmind_hedge_pos", 100);
            beacons_pos_publisher_ = node.advertise<marvelmind::beacon_pos>("/marvelmind_beacon_pos", 100);
            publish_timer_ = node.createTimer(ros::Duration(1.0 / 1000), &MarvelmindDriver::publish_msg, this);
        }
        ros::spin();
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "marvelmind_driver");
    autolabor_driver::MarvelmindDriver driver;
    driver.run();
    return 0;
}

