#ifndef VZENSE_TYPES_H
#define VZENSE_TYPES_H

#include <stdint.h>
#include "Vzense_enums.h"
#ifdef DCAM_710
#include "DCAM710/Vzense_types_710.h"
#elif defined DCAM_305
#include "DCAM305/Vzense_types_305.h"
#elif defined DCAM_800
#include "DCAM800/Vzense_types_800.h"
#endif

#endif /* VZENSE_TYPES_H */
