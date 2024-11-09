#ifndef VZENSE_ENUMS_H
#define VZENSE_ENUMS_H

#include "Vzense_decmtype.h"

#ifdef DCAM_710
#include "DCAM710/Vzense_enums_710.h"
#elif defined DCAM_305
#include "DCAM305/Vzense_enums_305.h"
#elif defined DCAM_800
#include "DCAM800/Vzense_enums_800.h"
#endif

#endif /* VZENSE_ENUMS_H */
