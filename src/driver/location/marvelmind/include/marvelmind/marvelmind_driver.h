#ifndef PROJECT_MARVELMIND_DRIVER_H
#define PROJECT_MARVELMIND_DRIVER_H

#include <atomic>
#include <string>
#include <boost/bind.hpp>
#include <boost/thread.hpp>


#include <ros/ros.h>
#include "geometry_msgs/PointStamped.h"
#include "marvelmind/beacon_pos.h"

extern "C"
{
#include "marvelmind/marvelmind_hedge.h"
}

namespace autolabor_driver {

    static std::atomic_int message_received_flag(0);

    class MarvelmindDriver {
    public:
        MarvelmindDriver();

        ~MarvelmindDriver();

        void run();

    private:
        bool init();

        void publish_msg(const ros::TimerEvent &);

        bool hedge_receive_check();

        bool beacon_receive_check();

    private:
        struct MarvelmindHedge *hedge_ = nullptr;


        std::string port_name_, map_frame_;
        int baud_rate_;

        marvelmind::beacon_pos beacon_pos_msg_;
        geometry_msgs::PointStamped point_stamped_;

        ros::Publisher hedge_pos_publisher_;
        ros::Publisher beacons_pos_publisher_;

        ros::Timer publish_timer_;
    };
}


#endif //PROJECT_MARVELMIND_DRIVER_H
