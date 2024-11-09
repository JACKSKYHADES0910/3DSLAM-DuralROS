#ifndef VZENSE_ENUMS_305_H
#define VZENSE_ENUMS_305_H

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
	PsDepthAndIR15_RGB30 = 100,
	PsRGB30 ,
	PsStandBy 
}PsDataMode;

/**
 * @brief Camera device properties to get or set on a device.
 */
typedef enum{
	PsPropertySN_Str = 5,           //!< Device serial number (e.g.PD7110CGC9270020W). The maximum length is 63 bytes.
	PsPropertyFWVer_Str = 6,        //!< Device firmware version number (e.g. DCAM305_c086_pc_sv0.01_R6_20180917_b35). The maximum length is 63 bytes.
	PsPropertyHWVer_Str = 7,        //!< Device hardware version number (e.g. R6). The maximum length is 63 bytes.
	PsPropertyDataMode_UInt8 = 8,   //!< Sets the data mode when invoking ::PsSetDataMode(). See ::PsDataMode for more information.
	PsPropertyDataModeList = 9,		//!< Gets the data mode lists that the device support
	PsPropertyDepthRangeList = 10,	//!< Gets the depth range lists that the device support
}PsPropertyType;

/**
 * @brief Specifies the type of image frame.
 */
typedef enum{
	PsDepthFrame = 0,              //!< Depth frame with 16 bits per pixel in millimeters.
	PsIRFrame = 1,                 //!< IR frame with 16 bits per pixel.
	PsGrayFrame = 2,               //!< Mono gray frame with 8 bits per pixel. Not current available on the DCAM305.
	PsRGBFrame = 3,                //!< RGB frame with 24 bits per pixel in RGB/BGR format.
	PsMappedRGBFrame = 4,          //!< RGB frame with 24 bits per pixel in RGB/BGR format, that is mapped to depth camera space where the resolution is the same as the depth frame's resolution.\n 
	                               //!< This frame type can be enabled using ::PsSetMapperEnabledDepthToRGB().
	PsMappedDepthFrame = 5,        //!< Depth frame with 16 bits per pixel, in millimeters, that is mapped to RGB camera space where the resolution is same as the RGB frame's resolution.\n 
	                               //!< This frame type can be enabled using ::PsSetMapperEnabledRGBToDepth().
	PsMappedIRFrame = 6,           //!< IR frame with 16 bits per pixel that is mapped to RGB camera space where the resolution is the same as the RGB frame's resolution.\n 
	                               //!< This frame type can be enabled using ::PsSetMapperEnabledRGBToIR().
	PsConfidenceFrame = 8,         //!< Confidence frame with 16 bits per pixel.
	PsWDRDepthFrame = 9            //!< WDR depth frame with 16 bits per pixel in millimeters. This only takes effect when the data mode set to ::PsWDR_Depth.
}PsFrameType;

/**
 * @brief Specifies the type of camera sensor.
 */
typedef enum{
	PsDepthSensor = 0x01,          //!< Depth camera.
	PsRgbSensor = 0x02             //!< Color (RGB) camera.
}PsSensorType;

/**
 * @brief Specifies the image pixel format.
 */
typedef enum{
	PsPixelFormatDepthMM16,        //!< Depth image pixel format, 16 bits per pixel in mm.
	PsPixelFormatGray16,           //!< IR image pixel format, 16 bits per pixel.
	PsPixelFormatGray8,            //!< Gray image pixel format, 8 bits per pixel.

	//Color
	PsPixelFormatRGB888,           //!< Color image pixel format, 24 bits per pixel RGB format.
	PsPixelFormatBGR888            //!< Color image pixel format, 24 bits per pixel BGR format.
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
 
/** @brief Stream type 
 */
typedef enum {
	PsStreamDepth = 0,             //!< Depth Stream
	PsStreamIR = 1,                //!< IR Stream
	PsStreamRGB = 2,               //!< RGB Stream
	PsStreamAudio = 3,             //!< Audio Stream
	PsStreamIMU = 4                //!< IMU Data Stream
}PsStreamType;

/**	@brief	Resolution 
 */
typedef enum {
	PsRGB_Resolution_1920_1080 = 0,
	PsRGB_Resolution_1280_720 = 1,
	PsRGB_Resolution_640_480 = 2,
	PsRGB_Resolution_640_360 = 3,
}PsResolution;

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
#endif /* VZENSE_ENUMS_305_H */
