#include <sys/stat.h>
#include "Vzense_enums.h"
#include "pico_zense_driver.h"
#include "sensor_msgs/PointCloud.h"
#include "sensor_msgs/Image.h"
#include "sensor_msgs/image_encodings.h"

namespace autolabor_driver {
    PicoZenseDriver::PicoZenseDriver() : _session_index(0) {

    }

    PicoZenseDriver::~PicoZenseDriver() {
        if (_device_handle != nullptr) {
            Ps2_StopStream(_device_handle, _session_index);
            Ps2_CloseDevice(_device_handle);
            Ps2_Shutdown();
        }
    }

    void PicoZenseDriver::initParams() {
        ros::NodeHandle private_nh("~");
        private_nh.param<std::string>("namespace", _namespace, "pico_camera");
        private_nh.param<std::string>("frame_name", _frame_name, "pico_camera");
        private_nh.param<int>("device_index", _device_index, 0);
        private_nh.param<int>("read_frame_interval", _read_frame_interval, 100);
        private_nh.param<int>("depth_range", _depth_range, 0);
        private_nh.param<int>("background_filter_threshold", _background_filter_threshold, 20);
        private_nh.param<int>("skip_row", _skip_row, 0);
        private_nh.param<int>("skip_column", _skip_column, 0);

        private_nh.param<bool>("output_depth_image", _output_depth_image, false);
        ros::NodeHandle nh(_namespace);
        if (_output_depth_image) {
            _depth_image_pub = nh.advertise<sensor_msgs::Image>("depth_image", 5);
        }
        private_nh.param<bool>("output_color_image", _output_color_image, false);
        if (_output_color_image) {
            _color_image_pub = nh.advertise<sensor_msgs::Image>("color_image", 5);
        }
        private_nh.param<bool>("output_point_cloud", _output_point_cloud, true);
        if (_output_point_cloud) {
            _point_cloud_pub = nh.advertise<sensor_msgs::PointCloud>("point_cloud", 5);
        }
        private_nh.param<bool>("depth_spatial_filter", _depth_spatial_filter, true);
        private_nh.param<bool>("depth_time_filter", _depth_time_filter, true);
        private_nh.param<bool>("depth_distortion_correction", _depth_distortion_correction, true);
        private_nh.param<bool>("depth_straighten_correction", _depth_straighten_correction, true);
    }

    bool PicoZenseDriver::initCamera() {
        // Init SDK
        if ((_status = Ps2_Initialize()) != PsRetOK) {
            ROS_ERROR("Ps2_Initialize error, error code : %d", _status);
            return false;
        }
        // Get Count
        uint32_t device_count = 0;
        if ((_status = Ps2_GetDeviceCount(&device_count)) != PsRetOK) {
            ROS_ERROR("Ps2_GetDeviceCount error, error code : %d", _status);
            return false;
        } else if (device_count == 0) {
            ROS_ERROR("No Device connected!");
            return false;
        }
        // Open Device
        if (_device_index < device_count) {
            PsDeviceInfo device_info;
            Ps2_GetDeviceInfo(&device_info, _device_index);
            if ((_status = Ps2_OpenDevice(device_info.uri, &_device_handle)) != PsRetOK) {
                ROS_ERROR("Ps2_OpenDevice error, error code : %d", _status);
                return false;
            }

            if ((_status = Ps2_StartStream(_device_handle, _session_index)) != PsRetOK) {
                ROS_ERROR("Ps2_StartStream error, error code : %d", _status);
                return false;
            }

            if (configCamera()) {
                return true;
            }
        }
        ROS_ERROR("Device number %d exceeds maximum", _device_index);
        return false;
    }

    bool PicoZenseDriver::configCamera() {
        // Set Data Mode
        if (_output_color_image) {
            Ps2_SetDataMode(_device_handle, _session_index, PsDepthAndRGB_30);
            Ps2_SetColorPixelFormat(_device_handle, _session_index, PsPixelFormatBGR888);
        } else {
            Ps2_SetDataMode(_device_handle, _session_index, PsDepthAndIR_30);
            Ps2_SetIrFrameEnabled(_device_handle, _session_index, false);
        }

        PsDepthRange depthRange;
        switch (std::max(0, std::min(8, _depth_range))) {
            case 0:
                depthRange = PsNearRange;
                break;
            case 1:
                depthRange = PsMidRange;
                break;
            case 2:
                depthRange = PsFarRange;
                break;
            case 3:
                depthRange = PsXNearRange;
                break;
            case 4:
                depthRange = PsXMidRange;
                break;
            case 5:
                depthRange = PsXFarRange;
                break;
            case 6:
                depthRange = PsXXNearRange;
                break;
            case 7:
                depthRange = PsXXMidRange;
                break;
            case 8:
                depthRange = PsXXFarRange;
                break;
            default:
                ROS_ERROR("something wrong");
                return false;
        }
        Ps2_SetDSPEnabled(_device_handle, _session_index, true);
        Ps2_SetDepthRange(_device_handle, _session_index, depthRange);
        Ps2_SetSpatialFilterEnabled(_device_handle, _session_index, _depth_spatial_filter);
        Ps2_SetTimeFilterEnabled(_device_handle, _session_index, _depth_time_filter);
        Ps2_SetComputeRealDepthCorrectionEnabled(_device_handle, _session_index, _depth_straighten_correction);
        Ps2_SetDepthDistortionCorrectionEnabled(_device_handle, _session_index, _depth_distortion_correction);
        Ps2_SetThreshold(_device_handle, _session_index, _background_filter_threshold);
        return true;
    }

    void PicoZenseDriver::publishColorImage() {
        if (_output_color_image && ready_.rgb &&
            Ps2_GetFrame(_device_handle, _session_index, PsRGBFrame, &_color_frame) == PsRetOK) {
            sensor_msgs::Image img_msg;
            img_msg.header.frame_id = _frame_name + "_color_frame";
            img_msg.header.stamp = ros::Time::now();
            img_msg.width = _color_frame.width;
            img_msg.height = _color_frame.height;
            img_msg.is_bigendian = false;
            img_msg.encoding = sensor_msgs::image_encodings::BGR8;
            img_msg.step = img_msg.width * 3;
            int len = img_msg.width * img_msg.height * 3;
            img_msg.data.resize(len);
            for (int i = 0; i < len; i++) {
                img_msg.data[i] = _color_frame.pFrameData[i];
            }
            _color_image_pub.publish(img_msg);
        }
    }

    void PicoZenseDriver::publishDepthImage() {
        if (_output_depth_image && ready_.depth &&
            Ps2_GetFrame(_device_handle, _session_index, PsDepthFrame, &_depth_frame) == PsRetOK) {
            sensor_msgs::Image img_msg;
            img_msg.header.frame_id = _frame_name + "_depth_frame";
            img_msg.header.stamp = ros::Time::now();
            img_msg.width = _depth_frame.width;
            img_msg.height = _depth_frame.height;
            img_msg.is_bigendian = false;
            img_msg.encoding = sensor_msgs::image_encodings::MONO16;
            img_msg.step = img_msg.width * 2;
            int len = img_msg.width * img_msg.height * 2;
            img_msg.data.resize(len);
            for (int i = 0; i < len; i++) {
                img_msg.data[i] = _depth_frame.pFrameData[i];
            }
            _depth_image_pub.publish(img_msg);
        }
    }

    void PicoZenseDriver::publishPointCloud() {
        if (_output_point_cloud) {
            if (ready_.depth && !_output_depth_image) {
                Ps2_GetFrame(_device_handle, _session_index, PsDepthFrame, &_depth_frame);
            }
            PsVector3f point[_depth_frame.width * _depth_frame.height];
            _status = Ps2_ConvertDepthFrameToWorldVector(_device_handle, _session_index, _depth_frame, point);
            if (_status == PsRetOK) {
                sensor_msgs::PointCloud point_msg;
                point_msg.header.frame_id = _frame_name + "_depth_frame";
                point_msg.header.stamp = ros::Time::now();
                for (int i = 0; i < _depth_frame.height; i = i + 1 + _skip_row) {
                    for (int j = 0; j < _depth_frame.width; j = j + 1 + _skip_column) {
                        size_t index = i * _depth_frame.width + j;
                        if (point[index].x != 0 || point[index].y != 0 || point[index].z != 0) {
                            geometry_msgs::Point32 p;
                            p.x = point[index].x / 1000.0;
                            p.y = point[index].y / 1000.0;
                            p.z = point[index].z / 1000.0;
                            point_msg.points.push_back(p);
                        }
                    }
                }
                _point_cloud_pub.publish(point_msg);
            }
        }
    }


    void PicoZenseDriver::run() {
        initParams();
        ros::Duration duration(_read_frame_interval / 1000.0);
        if (initCamera()) {
            publishTf();
            while (ros::ok()) {
                if (Ps2_ReadNextFrame(_device_handle, _session_index, &ready_) == PsRetOK) {
                    publishColorImage();
                    publishDepthImage();
                    publishPointCloud();
                }
                duration.sleep();
            }
        }
    }

    void PicoZenseDriver::publishTf() {
        Ps2_GetCameraExtrinsicParameters(_device_handle, _session_index, &_camera_ep);
        tf::Matrix3x3 rotation_matrix(_camera_ep.rotation[0], _camera_ep.rotation[1], _camera_ep.rotation[2],
                                      _camera_ep.rotation[3], _camera_ep.rotation[4], _camera_ep.rotation[5],
                                      _camera_ep.rotation[6], _camera_ep.rotation[7], _camera_ep.rotation[8]);
        double roll, pitch, yaw;
        rotation_matrix.getRPY(roll, pitch, yaw);

        geometry_msgs::TransformStamped msg;
        msg.header.stamp = ros::Time::now();
        msg.header.frame_id = _frame_name + "_color_frame";
        msg.child_frame_id = _frame_name + "_depth_frame";
        msg.transform.rotation = tf::createQuaternionMsgFromRollPitchYaw(roll, pitch, yaw);
        msg.transform.translation.x = _camera_ep.translation[0] / 1000.0;
        msg.transform.translation.y = _camera_ep.translation[1] / 1000.0;
        msg.transform.translation.z = _camera_ep.translation[2] / 1000.0;
        _static_tf_broadcaster.sendTransform(msg);

        msg.header.frame_id = _frame_name;
        msg.child_frame_id = _frame_name + "_color_frame";
        msg.transform.rotation = tf::createQuaternionMsgFromRollPitchYaw(-1.57, 0.0, -1.57);
        msg.transform.translation.x = 0.031;
        msg.transform.translation.y = 0.0;
        msg.transform.translation.z = 0.0;
        _static_tf_broadcaster.sendTransform(msg);
    }
}

int main(int argc, char *argv[]) {
    ros::init(argc, argv, "PicoZenseDriver");
    autolabor_driver::PicoZenseDriver picoZenseDriver;
    picoZenseDriver.run();
    return 0;
}