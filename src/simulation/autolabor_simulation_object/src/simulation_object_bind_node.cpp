
#include "autolabor_simulation_stage/Obstacle.h"
#include "autolabor_simulation_object/simulation_object_bind_node.h"


namespace autolabor_simulation {

    SimulationObjectBind::SimulationObjectBind() : create_flag_(false) {
        ros::NodeHandle private_node("~");
        if (!private_node.getParam("object_id", object_id_)) {
            throw runtime_error("obstacle_id is not exist");
        }

        private_node.param("object_frame", object_frame_, string("real_map"));
        private_node.param("bind_frame", bind_frame_, string("base_link"));

        private_node.param("rate", rate_, 10);

        XmlRpc::XmlRpcValue xml_object_footprints;
        if (private_node.getParam("object_footprints", xml_object_footprints)) {
            ROS_ASSERT(xml_object_footprints.getType() == XmlRpc::XmlRpcValue::TypeArray);
            for (int i = 0; i < xml_object_footprints.size(); i++) {
                ROS_ASSERT(xml_object_footprints[i].getType() == XmlRpc::XmlRpcValue::TypeArray);
                ROS_ASSERT(xml_object_footprints[i].size() % 2 == 0);
                geometry_msgs::Polygon polygon;
                for (int j = 0; j < xml_object_footprints[i].size(); j = j + 2) {
                    ROS_ASSERT(xml_object_footprints[i][j].getType() == XmlRpc::XmlRpcValue::TypeDouble);
                    ROS_ASSERT(xml_object_footprints[i][j + 1].getType() == XmlRpc::XmlRpcValue::TypeDouble);
                    geometry_msgs::Point32 p;
                    p.x = (float) (static_cast<double>(xml_object_footprints[i][j]));
                    p.y = (float) (static_cast<double>(xml_object_footprints[i][j + 1]));
                    polygon.points.push_back(p);
                }
                object_footprints_.push_back(polygon);
            }
        }
    }

    SimulationObjectBind::~SimulationObjectBind() {

    }

    void SimulationObjectBind::run() {
        update_timer_ = nh_.createTimer(ros::Duration(1.0 / rate_), &SimulationObjectBind::updateCallback, this);
        client_ = nh_.serviceClient<autolabor_simulation_stage::Obstacle>("/obstacle_handle");
        ros::spin();
    }

    void SimulationObjectBind::updateCallback(const ros::TimerEvent &event) {
        if (tf_.canTransform(object_frame_, bind_frame_, ros::Time())) {
            tf_.lookupTransform(object_frame_, bind_frame_, ros::Time(), transform_);
            autolabor_simulation_stage::Obstacle msg;
            msg.request.obstacle_id = object_id_;
            if (!create_flag_) {
                msg.request.type = autolabor_simulation_stage::Obstacle::Request::NEW;
            } else {
                msg.request.type = autolabor_simulation_stage::Obstacle::Request::TRANSFORM;
            }
            msg.request.vertex = object_footprints_;
            msg.request.transform[0] = transform_.getOrigin().getX();
            msg.request.transform[1] = transform_.getOrigin().getY();
            msg.request.transform[2] = tf::getYaw(transform_.getRotation());
            if (client_.call(msg)) {
                if (!create_flag_) {
                    create_flag_ = true;
                }
            }
        }
    }
}

int main(int argc, char **argv){
    ros::init(argc, argv, "simulation_object_bind_node");
    autolabor_simulation::SimulationObjectBind simulation_object_bind;
    simulation_object_bind.run();
    return 0;
}