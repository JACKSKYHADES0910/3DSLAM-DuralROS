#ifndef SRC_SIMULATION_OBJECT_BIND_NODE_H
#define SRC_SIMULATION_OBJECT_BIND_NODE_H

#include "string"
#include "vector"

#include "ros/ros.h"
#include "tf/transform_listener.h"

#include "geometry_msgs/Polygon.h"

using namespace std;
namespace autolabor_simulation {
    class SimulationObjectBind {
    public:
        SimulationObjectBind();

        ~SimulationObjectBind();

        void run();

    private:
        void updateCallback(const ros::TimerEvent& event);

        bool create_flag_;

        int rate_;
        string object_id_, object_frame_, bind_frame_;
        vector<geometry_msgs::Polygon> object_footprints_;

        ros::NodeHandle nh_;
        tf::TransformListener tf_;
        ros::ServiceClient client_;
        ros::Timer update_timer_;

        tf::StampedTransform transform_;
    };
}


#endif //SRC_SIMULATION_OBJECT_BIND_NODE_H
