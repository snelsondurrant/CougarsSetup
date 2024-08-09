#!/bin/bash

##########################################################
# SETS THE NECESSARY VEHICLE CONFIG PARAMS
# - When setting up a new vehicle, do not directly edit
#   the file in ~/CougarsSetup/config; rather edit the
#   copied file generated by 'setup.sh' in ~/config
##########################################################

# This should match the vehicle device name (ex. 0 for "coug0")
VEHICLE_ID=0

DEPTH_KP=0.0
DEPTH_KI=0.0
DEPTH_KD=0.0
DEPTH_MIN_OUTPUT=0
DEPTH_MAX_OUTPUT=0
DEPTH_BIAS=0

HEADING_KP=0.0
HEADING_KI=0.0
HEADING_KD=0.0
HEADING_MIN_OUTPUT=0
HEADING_MAX_OUTPUT=0
HEADING_BIAS=0

VELOCITY_KP=0.0
VELOCITY_KI=0.0
VELOCITY_KD=0.0
VELOCITY_MIN_OUTPUT=0
VELOCITY_MAX_OUTPUT=0
VELOCITY_BIAS=0

cd /home/frostlab/ros2_ws
source install/setup.bash

ros2 topic pub --once /control_config frost_interfaces/msg/ControlConfig "{depth_kp: $DEPTH_KP, depth_ki: $DEPTH_KI, depth_kd: $DEPTH_KD, depth_min_output: $DEPTH_MIN_OUTPUT, depth_max_output: $DEPTH_MAX_OUTPUT, depth_bias: $DEPTH_BIAS, heading_kp: $HEADING_KP, heading_ki: $HEADING_KI, heading_kd: $HEADING_KD, heading_min_output: $HEADING_MIN_OUTPUT, heading_max_output: $HEADING_MAX_OUTPUT, heading_bias: $HEADING_BIAS, velocity_kp: $VELOCITY_KP, velocity_ki: $VELOCITY_KI, velocity_kd: $VELOCITY_KD, velocity_min_output: $VELOCITY_MIN_OUTPUT, velocity_max_output: $VELOCITY_MAX_OUTPUT, velocity_bias: $VELOCITY_BIAS}"

ros2 param set /moos_bridge vehicle_id $VEHICLE_ID
ros2 param set /manual_control vehicle_id $VEHICLE_ID
