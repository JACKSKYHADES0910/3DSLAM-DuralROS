#ifndef VZENSE_ENUMS_800_H
#define VZENSE_ENUMS_800_H

/**
 * @brief Depth range setting.\n 
 *        These set estimated ranges. Detection distances may be greater than what is listed for the given setting. \n 
 *        Precision and minimum distance for depth detection varies with longer ranges.
 */
typedef enum {
	PsUnknown = -1,
	PsNearRange = 0,               //!< Range0 - 1m
	PsMidRange = 1,                //!< Range1 - 2m
	PsFarRange = 2,                //!< Range2 - 4m	
	PsXNearRange = 3,              //!< Range3 - 5m
	PsXMidRange = 4,               //!< Range4 - 7m (NoCal)
	PsXFarRange = 5,               //!< Range5 - 7m (NoCal)
	PsXXNearRange = 6,             //!< Range6 - 9m (NoCal)
	PsXXMidRange = 7,              //!< Range7 - 11m (NoCal)
	PsXXFarRange = 8               //!< Range8 - 15m (NoCal)
}PsDepthRange;

/** 
 * @brief The data modes that determine the frame output from the device and the frame rate (fps). 
 */
typedef enum{
	PsDepth_30 = 0,					//!< Output both depth frames at 30 fps. The resolution of a depth frame is 640*480. 
	PsIR_30 = 1,					//!< Outputs both IR and RGB frames at 30 fps. The resolution of an IR frame is 640*480.
	PsDepthAndIR_30 = 2,			//!< Outputs both depth and IR frames at 30 fps. The resolution for both depth and IR frames is 640*480.
	PsNoCCD_30 = 4,					//!< Reserved for internal use.
	PsDepthAndIR_15 = 10,			//!< Outputs depth and IR frames at 15 fps, alternating between the two. The resolution of both depth and IR frames is 640*480.
	PsWDR_Depth = 11,               //!< WDR (Wide Dynamic Range) depth mode. Supports alternating multi-range depth frame output (e.g. Near/Far/Near/Far/Near).
	PsWDR_IR = 12,                  //!< WDR (Wide Dynamic Range) IR mode. Not currently implemented.
	PsWDR_DepthAndIR = 13,          //!< WDR (Wide Dynamic Range) Depth and IR mode. Not currently implemented.
}PsDataMode;

/**
 * @brief Camera device properties to get or set on a device.
 */
typedef enum{
	PsPropertySN_Str = 5,           //!< Device serial number (e.g.PD7110CGC9270020W). The maximum length is 63 bytes.
	PsPropertyFWVer_Str = 6,        //!< Device firmware version number (e.g. DCAM710_c086_pc_sv0.01_R6_20180917_b35). The maximum length is 63 bytes.
	PsPropertyHWVer_Str = 7,        //!< Device hardware version number (e.g. R6). The maximum length is 63 bytes.
	PsPropertyDataMode_UInt8 = 8,   //!< Sets the data mode when invoking ::PsSetDataMode(). See ::PsDataMode for more information.
	PsPropertyDataModeList = 9,		//!< Gets the data mode lists that the device support
	PsPropertyDepthRangeList = 10,	//!< Gets the depth range lists that the device support


	PsPropertyDeviceUpgradeFlag = 11,	//!< Sets Gets the network device UpgradeFlag
	PsPropertyDeviceMACAddr = 13,		//!< Sets Gets the network device MACAddr 
	PsPropertyDeviceIPAddr = 15,		//!< Sets Gets the network device IPAddress
	PsPropertyDeviceSubnetMask = 16		//!< Sets Gets the network device SubnetMask

}PsPropertyType;

/**
 * @brief Specifies the type of image frame.
 */
typedef enum{
	PsDepthFrame = 0,              //!< Depth frame with 16 bits per pixel in millimeters.
	PsIRFrame = 1,                 //!< IR frame with 16 bits per pixel.
	PsWDRDepthFrame = 9            //!< WDR depth frame with 16 bits per pixel in millimeters. This only takes effect when the data mode set to ::PsWDR_Depth.
}PsFrameType;

/**
 * @brief Specifies the type of camera sensor.
 */
typedef enum{
	PsDepthSensor = 0x01,          //!< Depth camera.
}PsSensorType;

/**
 * @brief Specifies the image pixel format.
 */
typedef enum{
	PsPixelFormatDepthMM16,        //!< Depth image pixel format, 16 bits per pixel in mm.
	PsPixelFormatGray16,           //!< IR image pixel format, 16 bits per pixel.
	PsPixelFormatGray8,            //!< Gray image pixel format, 8 bits per pixel.

}PsPixelFormat;

/**
 * @brief Return status codes for all APIs.\n 
 * 		  <code>PsRetOK = 0</code> means the API successfully completed its operation.\n 
 * 		  All other codes indicate a device, parameter, or API usage error.
 */
typedef enum{
	PsRetOK = 0,                     //!< The function completed successfully.
	PsRetNoDeviceConnected = -1,     //!< There is no depth camera connected or the camera has not been connected correctly. Check the hardware connection or try unplugging and re-plugging the USB cable.
	PsRetInvalidDeviceIndex = -2,    //!< The input device index is invalid.
	PsRetDevicePointerIsNull = -3,   //!< The device structure pointer is null.
	PsRetInvalidFrameType = -4,      //!< The input frame type is invalid.
	PsRetFramePointerIsNull = -5,    //!< The output frame buffer is null.
	PsRetNoPropertyValueGet = -6,    //!< Cannot get the value for the specified property.
	PsRetNoPropertyValueSet = -7,    //!< Cannot set the value for the specified property.
	PsRetPropertyPointerIsNull = -8, //!< The input property value buffer pointer is null.
	PsRetPropertySizeNotEnough = -9, //!< The input property value buffer size is too small to store the specified property value.
	PsRetInvalidDepthRange = -10,    //!< The input depth range mode is invalid.
	PsRetReadNextFrameError = -11,   //!< An error occurred when capturing the next image frame.
	PsRetInputPointerIsNull = -12,   //!< An input pointer parameter is null.
	PsRetCameraNotOpened = -13,      //!< The camera has not been opened.
	PsRetInvalidCameraType = -14,    //!< The specified type of camera is invalid.
	PsRetInvalidParams = -15,        //!< One or more of the parameter values provided are invalid.

	PsRetOthers = -255,	             //!< An unknown error occurred.
}PsReturnStatus;

/**
 * @brief Specifies the number of depth ranges defined for WDR. Currently only two or three ranges are supported (e.g. Near/Far or Near/Mid/Far).
 */
typedef enum {
	PsWDRTotalRange_Two = 2,	//!< Two depth ranges.
	PsWDRTotalRange_Three = 3	//!< Three depth ranges.
}PsWDRTotalRange;

/** @brief The WDR style setting used for ::PsSetWDRStyle(). This determines if the WDR image output is a fusion from multiple ranges (e.g. Near/Far fusion)\n 
 * or an alternative output (e.g. Near/Far/Near/Far ... ).
 */ 
typedef enum {
	PsWDR_FUSION = 0,              //!< WDR image output is fused from multiple ranges.
	PsWDR_ALTERNATION = 1          //!< WDR image output alternates between depths (e.g. Near/Far/Near/Far ... ).
}PsWDRStyle;

/** @brief Stream type 
 */
typedef enum {
	PsStreamDepth = 0,             //!< Depth Stream
	PsStreamIR = 1,                //!< IR Stream
	PsStreamAudio = 3,             //!< Audio Stream
	PsStreamIMU = 4                //!< IMU Data Stream
}PsStreamType;

typedef enum
{
	LinkeUNKNOWN = 0,
	LinkUSB = 1,
	LinkSocket = 2,
	LinkMIPI = 3,
}PsLinkType;

typedef enum {
	ConnectUNKNOWN,
	Unconnected,
	Connected,
	Opened,
}PsConnectStatus;

typedef enum
{
	NONE,
	DCAMUPDATE = 1,
	DCAM305 = 305,
	DCAM500 = 500,
	DCAM510 = 510,
	DCAM710 = 710,
	DCAM800 = 800,
	DCAM_MIPI = 801,
	DCAM800LITE = 802,
	DCAM800LITEUSB = 803,
	MAX,
}PsDeviceType;
#endif /* VZENSE_ENUMS_800_H */
