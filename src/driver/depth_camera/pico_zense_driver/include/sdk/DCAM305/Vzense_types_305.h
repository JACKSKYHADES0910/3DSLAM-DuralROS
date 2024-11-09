#ifndef VZENSE_TYPES_305_H
#define VZENSE_TYPES_305_H

#include <stdint.h>
#include "Vzense_enums_305.h"

typedef uint16_t PsDepthPixel;  //!< Depth image pixel type in 16-bit
typedef uint16_t PsGray16Pixel; //!< Gray image pixel type in 16-bit
typedef uint8_t PsGray8Pixel;   //!< Gray image pixel type in 8-bit

#pragma pack (push, 1)
/**
 * @brief Color image pixel type in 24-bit RGB format.
 */
typedef struct
{
	uint8_t r;	//!< Red
	uint8_t g;	//!< Green
	uint8_t b;	//!< Blue
} PsRGB888Pixel;

/**
 * @brief Color image pixel type in 24-bit BGR format.
 */
typedef struct
{
	uint8_t b;	//!< Blue
	uint8_t g;	//!< Green
	uint8_t r;	//!< Red
} PsBGR888Pixel;

/**
 * @brief Specifies the frame mode including the pixel format, resolution, and frame rate.
 */
typedef struct
{
	PsPixelFormat pixelFormat;			//!< The pixel format used by a frame.
	int32_t       resolutionWidth;		//!< The width of the image, in pixels.
	int32_t       resolutionHeight;		//!< The height of the image, in pixels.
	int32_t       fps;					//!< The image stream frame rate.
}PsFrameMode;

/**
 * @brief Stores the x, y, and z components of a 3D vector.
 */
typedef struct  
{
	float x, y, z;	//!< The x, y, and z components of the vector.
}PsVector3f;

/**
 * @brief Contains depth information for a given pixel.
 */
typedef struct
{
	int          depthX;    //!< The x coordinate of the pixel.
	int          depthY;    //!< The y coordinate of the pixel.
	PsDepthPixel depthZ;    //!< The depth of the pixel, in millimeters.
}PsDepthVector3;

/**
 * @brief Camera intrinsic parameters and distortion coefficients.
 */
typedef struct
{
	double	fx;  //!< Focal length x (pixel)
	double	fy;  //!< Focal length y (pixel)
	double	cx;  //!< Principal point x (pixel)
	double	cy;  //!< Principal point y (pixel)
	double	k1;  //!< Radial distortion coefficient, 1st-order
	double	k2;  //!< Radial distortion coefficient, 2nd-order
	double	p1;  //!< Tangential distortion coefficient
	double	p2;  //!< Tangential distortion coefficient
	double	k3;  //!< Radial distortion coefficient, 3rd-order
	double	k4;  //!< Radial distortion coefficient, 4st-order
	double	k5;  //!< Radial distortion coefficient, 5nd-order
	double	k6;  //!< Radial distortion coefficient, 6rd-order
}PsCameraParameters;

/** 
 * @brief Specifies the camera’s location and orientation extrinsic parameters.
 */
typedef struct
{
	double rotation[9];     //!< Orientation stored as an array of 9 double representing a 3x3 rotation matrix.
	double translation[3];  //!< Location stored as an array of 3 double representing a 3-D translation vector.
}PsCameraExtrinsicParameters;

/**
 * @brief Depth/IR/RGB image frame data.
 */
typedef struct
{
	uint32_t       frameIndex;    //!< The index of the frame.
	PsFrameType    frameType;     //!< The type of frame. See ::PsFrameType for more information.
	PsPixelFormat  pixelFormat;   //!< The pixel format used by a frame. See ::PsPixelFormat for more information.
	uint8_t        imuFrameNo;    //!< Used to synchronize with IMU, in the range of 0 to 255.
	uint8_t*       pFrameData;    //!< A buffer containing the frame’s image data.
	uint32_t       dataLen;       //!< The length of pFrame, in bytes.
	float          exposureTime;  //!< The exposure time, in milliseconds.
	PsDepthRange   depthRange;    //!< The depth range mode of the current frame. Used only for depth frames.
	uint16_t       width;		  //!< The width of the frame, in pixels.
	uint16_t       height;        //!< The height of the frame, in pixels.
}PsFrame;

/**
 * @brief Specifies the GMMGain including the gain value and option type.
 */
typedef struct
{
	uint16_t gain;	//!< The GMM gain value of the device.
	uint8_t	option;	//!< The option type of setting the GMM gain effective time. 0:Immediate effect, invalid after camera closure; 1:Permanent entry into force.
}PsGMMGain;

typedef struct
{
	uint32_t depth : 1;
	uint32_t ir : 1;
	uint32_t rgb : 1;
	uint32_t mappedRGB : 1;
	uint32_t mappedDepth : 1;
	uint32_t mappedIR : 1;
	uint32_t confidence : 1;
	uint32_t wdrDepth : 1;
	uint32_t reserved : 24;
}PsFrameReady;

struct Device;
typedef Device* PsDeviceHandle;

typedef struct
{
	int SessionCount;
	PsDeviceType devicetype;
	char uri[256]; //DeviceType:sn=xxxxx eg:DCAM305:sn=xxxxxxx
	char fw[50];
	PsConnectStatus status;
}PsDeviceInfo;

typedef struct
{
	uint8_t index;
	uint8_t count;
	uint8_t datamodelist[32];  
}PsDataModeList;

typedef struct
{
	uint8_t index;
	uint8_t count;
	uint8_t depthrangelist[9];
}PsDepthRangeList;

typedef struct
{
	uint8_t		depthMode; //PsDepthMode
	uint16_t	depthMaxNear;
	uint16_t	depthMaxMid;
	uint16_t	depthMaxFar;

	uint16_t	effectDepthMaxNear;
	uint16_t	effectDepthMaxMid;
	uint16_t	effectDepthMaxFar;

	uint16_t	effectDepthMinNear;
	uint16_t	effectDepthMinMid;
	uint16_t	effectDepthMinFar;
}PsMeasuringRange;

union IPAddr
{
	uint32_t ip_int32;
	struct
	{
		uint8_t s3;
		uint8_t s2;
		uint8_t s1;
		uint8_t s0;
	}ip_int8;
};

typedef struct
{
	PsLinkType linkType;
	union LinkInfo
	{
		struct Socket
		{
			IPAddr ip;
		}socket;
		struct USB
		{
			int16_t vid;
			int16_t pid;
		}usb;
	}linkInfo;
	PsDataMode* pSupportModeList;
	int supportModeListLen;
	PsDeviceType devicetype;
	int16_t rotatetype;
}PsSessionInfo;

/**
* @brief hotplug status callback function
* uri    return the uri of the Device, See ::PsDeviceInfo
* state  0:device added , 1:device removed
*/
typedef void(*PtrHotPlugStatusCallback)(const char* uri, int state);

#pragma pack (pop)

#endif /* VZENSE_TYPES_H */
