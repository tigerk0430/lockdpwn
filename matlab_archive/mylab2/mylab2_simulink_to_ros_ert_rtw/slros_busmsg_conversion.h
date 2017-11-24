#ifndef _SLROS_BUSMSG_CONVERSION_H_
#define _SLROS_BUSMSG_CONVERSION_H_

#include <ros/ros.h>
#include <std_msgs/Float32.h>
#include "mylab2_simulink_to_ros_types.h"
#include "slros_msgconvert_utils.h"


void convertFromBus(std_msgs::Float32* msgPtr, SL_Bus_mylab2_simulink_to_ros_std_msgs_Float32 const* busPtr);
void convertToBus(SL_Bus_mylab2_simulink_to_ros_std_msgs_Float32* busPtr, std_msgs::Float32 const* msgPtr);


#endif
