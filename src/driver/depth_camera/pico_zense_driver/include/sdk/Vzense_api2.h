#ifndef VZENSE_API2_H
#define VZENSE_API2_H
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

#include "Vzense_decmtype.h"
 
#ifdef DCAM_710
#include "DCAM710/Vzense_api_710.h"
#elif defined DCAM_305
#include "DCAM305/Vzense_api_305.h"
#elif defined DCAM_800
#include "DCAM800/Vzense_api_800.h"
#endif

#endif /* VZENSE_API2_H */
