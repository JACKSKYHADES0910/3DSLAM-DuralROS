#ifndef VZENSE_API_800_H
#define VZENSE_API_800_H

/**
* @file Vzense_api2.h
* @brief Vzense API header file.
* Copyright (c) 2018-2019 V Interactive, Inc.
*/

/*! \mainpage Vzense API Documentation
*
* \section intro_sec Introduction
*
* Welcome to the Vzense API documentation. This documentation enables you to quickly get started in your development efforts to programmatically interact with the Vzense TOF RGBD Camera (DCAM710).
*/

#include "Vzense_define.h"

/**
* @brief 		Initializes the API on the device. This function must be invoked before any other Vzense APIs.
* @return		::PsRetOK if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_Initialize();

/**
* @brief 		Shuts down the API on the device and clears all resources allocated by the API. After invoking this function, no other Vzense APIs can be invoked.
* @return		::PsRetOK	if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_Shutdown();

/**
* @brief 		Returns the number of camera devices currently connected.
* @param[out]	pDeviceCount	Pointer to a 32-bit integer variable in which to return the device count.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDeviceCount(uint32_t* pDeviceCount);

/**
* @brief 		Returns the info lists of the deviceCount camera devices.
* @param[in] 	deviceCount		the number of camera devices.
* @param[out]	pDevicesList	Pointer to a buffer in which to store the deviceCount devices infos.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDeviceListInfo(PsDeviceInfo* pDevicesList, uint32_t deviceCount);

/**
* @brief 		Returns the info of the deviceIndex camera device.
* @param[in] 	deviceIndex	The index of the device to open. Device indices range from 0 to device count - 1.
* @param[out]	pDevices	Pointer to a buffer in which to store the device info.
* @return 		::PsRetOK	if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDeviceInfo(PsDeviceInfo* pDevices, uint32_t deviceIndex);

/**
* @brief 		Opens the device specified by <code>uri</code>. The device must be subsequently closed using PsCloseDevice().
* @param[in] 	uri			the uri of the device. See ::PsDeviceInfo for more information.
* @param[out]	pDevices	the handle of the device on which to open.
* @return: 		::PsRetOK	if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_OpenDevice(const char* uri, PsDeviceHandle* pDevice);

/**
* @brief 		Closes the device specified by <code>device</code> that was opened using PsOpenDevice.
* @param[in] 	device		The handle of the device to close.
* @return: 		::PsRetOK	if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_CloseDevice(PsDeviceHandle device);

/**
* @brief 		Starts capturing the image stream indicated by <code>device</code>. \n
Invoke Ps2_StopStream() to stop capturing the image stream.
* @param[in] 	device			The handle of the device on which to start capturing the image stream.
* @param[in] 	sessionIndex	The index of the session that include N Tof sensors and maximum N RGB sensors. \n
								range from 0 to ::SessionCount - 1. See ::PsDeviceInfo for more information. \n
								For example, the camera <code>device</code> has 2 Tof sensor and 1 rgb sensor, the ::SessionCount is 2.\n
								If the <code>sessionIndex</code> is 0 mean that start 1 tof stream and the rgb stream, \n
								and if the <code>sessionIndex</code> is 1 mean that start only 1 tof stream.						
* @return 	    ::PsRetOK if	the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_StartStream(PsDeviceHandle device, uint32_t sessionIndex);

/**
* @brief 		Stops capturing the image stream on the device specified by <code>device</code>. that was started using Ps2_StartStream.
* @param[in] 	device			The handle of the device on which to stop capturing the image stream.
* @param[in] 	sessionIndex	The index of the session that include N Tof sensors and maximum N RGB sensors. \n
								range from 0 to ::SessionCount - 1. See ::PsDeviceInfo for more information. \n
								For example, the camera <code>device</code> has 2 Tof sensor and 1 rgb sensor, the ::SessionCount is 2.\n
								If the <code>sessionIndex</code> is 0 mean that stop 1 tof stream and the rgb stream, \n
								and if the <code>sessionIndex</code> is 1 mean that stop only 1 tof stream.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_StopStream(PsDeviceHandle device, uint32_t sessionIndex);

/**
* @brief 		Captures the next image frame from the device specified by <code>device</code>. This API must be invoked before capturing frame data using PsGetFrame().
* @param[in] 	device			The handle of the device on which to read the next frame.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	pFrameReady		Pointer to a buffer in which to store the signal on which image is ready to be get.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_ReadNextFrame(PsDeviceHandle device, uint32_t sessionIndex, PsFrameReady* pFrameReady);

/**
* @brief 		Returns the image data for the current frame from the device specified by <code>device</code>.\n
Before invoking this API, invoke PsReadNextFrame() to capture one image frame from the device.
* @param[in] 	device			The handle of the device to capture an image frame from.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	frameType		The image frame type.
* @param[out]	pPsFrame		Pointer to a buffer in which to store the returned image data.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetFrame(PsDeviceHandle device, uint32_t sessionIndex, PsFrameType frameType, PsFrame* pPsFrame);

/**
* @brief  		Sets the output data mode for the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device for which to set the data mode.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	dataMode		The output data mode. See ::PsDataMode for more information.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetDataMode(PsDeviceHandle device, uint32_t sessionIndex, PsDataMode dataMode);

/**
* @brief  		Returns the output data mode from the device specified by <code>device</code>.
* @param[in]	device			The handle of the device for which to set the data mode.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[Out]	dataMode		The output data mode. See ::PsDataMode for more information.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDataMode(PsDeviceHandle device, uint32_t sessionIndex, PsDataMode* dataMode);

/**
* @brief 		Returns the depth range mode from the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device from which to get the depth range.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	pDepthRange		Pointer to a ::PsDepthRange variable in which to store the returned depth range mode.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDepthRange(PsDeviceHandle device, uint32_t sessionIndex, PsDepthRange* pDepthRange);

/**
* @brief 		Sets the depth range mode for the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device on which to set the depth range.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	depthRange 		Specifies the depth range mode.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetDepthRange(PsDeviceHandle device, uint32_t sessionIndex, PsDepthRange depthRange);

/**
* @brief 		Returns the threshold value for the background filter from the device specified by <code>device</code>. \n
The value represents the cut-off point for distant data that the filter should ignore. \n
For example, if 20.0 is specified, data with 20% or less confidence will be dropped.
* @param[in] 	device			The handle of the device from which to get the threshold. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out] 	pThreshold 		Pointer to a 16-bit unsigned integer variable in which to return the threshold value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetThreshold(PsDeviceHandle device, uint32_t sessionIndex, uint16_t* pThreshold);

/**
* @brief 		Sets the threshold value for the background filter for the device specified by <code>device</code>. \n
The value represents the cut-off point for distant data that the filter should ignore.  \n
For example, if 20.0 is specified, data with 20% or less confidence will be dropped.
* @param[in] 	device			The handle of the device on which to set the threshold. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	threshold		The threshold value to set. 0 will attempt to keep all point data but may not be accurate further away; 100 or higher will reject almost all point data leaving only the closest points.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetThreshold(PsDeviceHandle device, uint32_t sessionIndex, uint16_t threshold);

/**
* @brief 		Returns the pulse count from the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device on which to set the pulse count. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out] 	pPulseCount		Pointer to a 16-bit unsigned integer variable in which to store the pulse count value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetPulseCount(PsDeviceHandle device, uint32_t sessionIndex, uint16_t* pPulseCount);

/**
* @brief 		Sets the pulse count for the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device on which to set the pulse count. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	pulseCount 		The pulse count value to set.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetPulseCount(PsDeviceHandle device, uint32_t sessionIndex, uint16_t pulseCount);

/**
* @brief 		Returns the the device's GMM gain.
* @param[in]	device			The handle of the device from which to get the GMM gain.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out] 	gmmgain 		Pointer to a variable in which to store the returned GMM gain.
* @return		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetGMMGain(PsDeviceHandle device, uint32_t sessionIndex, uint16_t* gmmgain);

/**
* @brief 		Sets the device GMM gain on a device.
* @param[in]	device			The handle of the device on which to set the GMM gain.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	gmmgain			The GMM gain value to set. See ::PsGMMGain for more information.
* @return		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetGMMGain(PsDeviceHandle device, uint32_t sessionIndex, PsGMMGain gmmgain);

/**
* @brief 		Returns a specific property value from the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device from which to get the property value. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	propertyType	The type of property to get from the device. See ::PsPropertyType for more information.
* @param[out]	pData			Pointer to a buffer to store the returned property value.
* @param[out]	pDataSize		The size, in bytes, of the property value returned in <code>pData</code>.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetProperty(PsDeviceHandle device, uint32_t sessionIndex, int32_t propertyType, void* pData, int32_t* pDataSize);

/**
* @brief 		Set the corresponding property value for the device specified by <code>device</code>.
* @param[in]	device			The handle of the device from which to set the property value. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	propertyType	The type of property to set on the device.
* @param[in]	pData			Pointer to a buffer containing the property value.
* @param[in]	dataSize		The size, in bytes, of the property value contained in <code>pData</code>.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetProperty(PsDeviceHandle device, uint32_t sessionIndex, int32_t propertyType, const void* pData, int32_t dataSize);

/**
* @brief 		Returns the internal intrinsic and distortion coefficient parameters from the device specified by <code>device</code>.
* @param[in] 	device				The handle of the device from which to get the internal parameters. 
* @param[in] 	sessionIndex		The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	sensorType			The type of sensor (depth or RGB) from which to get parameter information. Pass in the applicable value defined by ::PsSensorType.
* @param[out] 	pCameraParameters	Pointer to a PsCameraParameters variable in which to store the parameter values.
* @return 		::PsRetOK			if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetCameraParameters(PsDeviceHandle device, uint32_t sessionIndex, PsSensorType sensorType, PsCameraParameters* pCameraParameters);

/**
* @brief 		Returns the camera rotation and translation coefficient parameters from the device specified by <code>device</code>.
* @param[in] 	device						The handle of the device from which to get the extrinsic parameters. 
* @param[in] 	sessionIndex				The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out] 	pCameraExtrinsicParameters 	Pointer to a ::PsGetCameraExtrinsicParameters variable in which to store the parameters.
* @return 		::PsRetOK					if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetCameraExtrinsicParameters(PsDeviceHandle device, uint32_t sessionIndex, PsCameraExtrinsicParameters* pCameraExtrinsicParameters);

/**
* @brief 		Sets the WDR output mode.
* @param[in]	device			The handle of the device on which to set the mode.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	pWDRMode 		The WDR output mode to set. See ::PsWDROutputMode for more information.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetWDROutputMode(PsDeviceHandle device, uint32_t sessionIndex, PsWDROutputMode* pWDRMode);

/**
* @brief		Gets the current WDR output mode.
* @param[in]	device			The handle of the device on which to get the mode from.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	pWDRMode 		A pointer to a ::PsWDROutputMode variable in which to store the current WDR output mode.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetWDROutputMode(PsDeviceHandle device, uint32_t sessionIndex, PsWDROutputMode* pWDRMode);

/**
* @brief 		Sets the WDR style on the device.
* @param[in] 	device			The handle of the device on which to set the WDR style.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	wdrStyle 		The wide dynamic range merge style to use. See ::PsWDRStyle for more information.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetWDRStyle(PsDeviceHandle device, uint32_t sessionIndex, PsWDRStyle wdrStyle);
/**
* @brief 		Gets the MeasuringRange in depthRange.
* @param[in] 	device			The handle of the device on which to set the WDR style.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	depthRange	 	Specifies the depth range mode.
* @param[out]	pMeasuringRange A pointer to a ::PsMeasuringRange variable in which to store the MeasuringRange in depthRange.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetMeasuringRange(PsDeviceHandle device, uint32_t sessionIndex, PsDepthRange depthRange, PsMeasuringRange* pMeasuringRange);

/**
* @brief 		Converts the input points from world coordinate space to depth coordinate space.
* @param[in]	device			The handle of the device on which to perform the operation.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	pWorldVector 	Pointer to a buffer containing the x, y, and z values of the input world coordinates to be converted, measured in millimeters.
* @param[out]	pDepthVector 	Pointer to a buffer in which to output the converted x, y, and z values of the depth coordinates. \n
*								x and y are measured in pixels, where 0, 0 is located at the top left corner of the image. \n
*								z is measured in millimeters, based on the ::PsPixelFormat depth frame.
* @param[in]	pointCount 		The number of coordinates to convert.
* @param[in]	pCameraParam	The intrinsic camera parameters for the depth camera. See ::PsGetCameraParameters.
* @return		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_ConvertWorldToDepth(PsDeviceHandle device, uint32_t sessionIndex, PsVector3f* pWorldVector, PsDepthVector3* pDepthVector, int32_t pointCount, PsCameraParameters* pCameraParam);

/**
* @brief 		Converts the input points from depth coordinate space to world coordinate space.
* @param[in] 	device			The handle of the device on which to perform the operation.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	pDepthVector 	Pointer to a buffer containing the x, y, and z values of the depth coordinates to be converted. \n
*      							 x and y are measured in pixels, where 0, 0 is located at the top left corner of the image. \n
*	                            z is measured in millimeters, based on the ::PsPixelFormat depth frame.
* @param[out] 	pWorldVector 	Pointer to a buffer in which to output the converted x, y, and z values of the world coordinates, measured in millimeters.
* @param[in] 	pointCount 		The number of points to convert.
* @param[in]	pCameraParam	The intrinsic camera parameters for the depth camera. See ::PsGetCameraParameters.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_ConvertDepthToWorld(PsDeviceHandle device, uint32_t sessionIndex, PsDepthVector3* pDepthVector, PsVector3f* pWorldVector, int32_t pointCount, PsCameraParameters* pCameraParam);

/**
* @brief 		Converts the input Depth frame from depth coordinate space to world coordinate space on the device.
* @param[in] 	device			The handle of the device on which to perform the operation.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	depthFrame		The depth frame.
* @param[out] 	pWorldVector 	Pointer to a buffer in which to output the converted x, y, and z values of the world coordinates, measured in millimeters.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_ConvertDepthFrameToWorldVector(PsDeviceHandle device, uint32_t sessionIndex, const PsFrame& depthFrame, PsVector3f* pWorldVector);

/**
* @brief 		Enables or disables the depth distortion correction feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetDepthDistortionCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief 		Returns the Boolean value of whether the depth distortion correction feature is enabled or disabled.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	bEnabled		Pointer to a variable in which to store the returned Boolean value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetDepthDistortionCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool *bEnabled);

/**
* @brief 		Enables or disables the Ir distortion correction feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetIrDistortionCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief 		Returns the Boolean value of whether the Ir distortion correction feature is enabled or disabled.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	bEnabled		Pointer to a variable in which to store the returned Boolean value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetIrDistortionCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool *bEnabled);

/**
* @brief		Enables or disables the ComputeRealDepth feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetComputeRealDepthCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief 		Returns the Boolean value of whether the ComputeRealDepth feature is enabled or disabled.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	bEnabled		Pointer to a variable in which to store the returned Boolean value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetComputeRealDepthCorrectionEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool *bEnabled);

/**
* @brief		Enables or disables the SpatialFilter feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetSpatialFilterEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief 		Returns the Boolean value of whether the SpatialFilter feature is enabled or disabled.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	bEnabled		Pointer to a variable in which to store the returned Boolean value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetSpatialFilterEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool *bEnabled);

/**
* @brief		Enables or disables the TimeFilter feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/ 
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetTimeFilterEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief 		Returns the Boolean value of whether the TimeFilter feature is enabled or disabled.
* @param[in]	device			The handle of the device on which to enable or disable the feature. 
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out]	bEnabled		Pointer to a variable in which to store the returned Boolean value.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetTimeFilterEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool *bEnabled);

/**
* @brief		Enables or disables the Depth Stream feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetDepthFrameEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief		Enables or disables the IR Stream feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	bEnabled		Set to <code>true</code> to enable the feature or <code>false</code> to disable the feature.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetIrFrameEnabled(PsDeviceHandle device, uint32_t sessionIndex, bool bEnabled);

/**
* @brief		Sets the ImageMirror feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	type			1 left-right mirror; 2 up-down mirror;3 both mirror (rotation 180)
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetImageMirror(PsDeviceHandle device, uint32_t sessionIndex, int32_t type);

/**
* @brief		Sets the ImageRotation feature.
* @param[in]	device			The handle of the device on which to enable or disable the feature.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in]	type			0 counterclock 906у; 1 counterclock 1806у;2 counterclock 2706у
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetImageRotation(PsDeviceHandle device, uint32_t sessionIndex, int32_t type);
/**
* @brief 		Set hotplug status callback function
* @param[in]	pCallback		Pointer to the callback function. See ::PtrHotPlugStatusCallback 
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetHotPlugStatusCallback(PtrHotPlugStatusCallback pCallback);

/**
* @brief 		Returns the pulse count from the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device on which to set the pulse count.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[out] 	pwdrPulseCount	A pointer to a ::PsWDRPulseCount variable in which to store the PulseCount in WDR mode.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetWDRPulseCount(PsDeviceHandle device, uint32_t sessionIndex, PsWDRPulseCount* pwdrPulseCount);

/**
* @brief 		Sets the pulse count for the device specified by <code>device</code>.
* @param[in] 	device			The handle of the device on which to set the pulse count.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	pwdrPulseCount 	The PulseCount value in WDR mode to set.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_SetWDRPulseCount(PsDeviceHandle device, uint32_t sessionIndex, PsWDRPulseCount wdrpulseCount);

/**
* @brief 		Gets the serial number.
* @param[in] 	device			The handle of the device on which to set the pulse count.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	sn 				Pointer to a variable in which to store the returned sn value.
* @param[in] 	length 			The maximum length is 63 bytes.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetSerialNumber(PsDeviceHandle device, uint32_t sessionIndex, char* sn,int length);

/**
* @brief 		Gets the firmware version number.
* @param[in] 	device			The handle of the device on which to set the pulse count.
* @param[in] 	sessionIndex	The index of the session. See ::Ps2_StartStream() & ::Ps2_StopStream() api for more information.
* @param[in] 	fw 				Pointer to a variable in which to store the returned fw value.
* @param[in] 	length 			The maximum length is 63 bytes.
* @return 		::PsRetOK		if the function succeeded, or one of the error values defined by ::PsReturnStatus.
*/
VZENSE_C_API_EXPORT PsReturnStatus Ps2_GetFirmwareVersionNumber(PsDeviceHandle device, uint32_t sessionIndex, char* fw, int length);

#endif /* VZENSE_API_800_H */
