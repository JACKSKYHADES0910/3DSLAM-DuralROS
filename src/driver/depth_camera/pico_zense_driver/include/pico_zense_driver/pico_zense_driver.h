#ifndef SRC_PICO_ZENSE_DRIVER_H
#define SRC_PICO_ZENSE_DRIVER_H

#include "string"

#include "ros/ros.h"
#include "tf/transform_datatypes.h"
#include "tf2_ros/static_transform_broadcaster.h"

#include "Vzense_api2.h"


namespace autolabor_driver {
    class PicoZenseDriver {
    public:
        PicoZenseDriver();

        ~PicoZenseDriver();

        void run();

    private:
        void initParams();

        bool initCamera();

        bool configCamera();

        void publishColorImage();

        void publishDepthImage();

        void publishPointCloud();

        void publishTf();

    private:
        // ros components
        ros::Publisher _color_image_pub, _depth_image_pub, _point_cloud_pub;
        tf2_ros::StaticTransformBroadcaster _static_tf_broadcaster;
        // ros params
        int _device_index;
        std::string _namespace;
        std::string _frame_name;
        bool _output_depth_image, _output_color_image, _output_point_cloud;
        int _read_frame_interval; // ms
        int _depth_range;
        bool _depth_spatial_filter, _depth_time_filter, _depth_distortion_correction, _depth_straighten_correction;
        int _background_filter_threshold;
        int _skip_row, _skip_column;

        // program params
        uint32_t _session_index = 0;
        PsDeviceHandle _device_handle = nullptr;
        PsReturnStatus _status;
        PsFrameReady _ready;

        PsFrameReady ready_;
        PsFrame _depth_frame = {0};
        PsFrame _color_frame = {0};

        PsCameraExtrinsicParameters _camera_ep;
    };
}


#endif //SRC_PICO_ZENSE_DRIVER_H
