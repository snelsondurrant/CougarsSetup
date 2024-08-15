#!/bin/bash

##########################################################
# SETS UP DOCKER IMAGE REQS ON A NEW RPI
# - Run this script on a newly flashed Raspberry Pi 5.
#   After running it, run "docker.sh" to load in and run
#   the most current image
##########################################################

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add user permissions
sudo usermod -aG docker frostlab
sudo usermod -aG dialout frostlab

# Set up volumes
mkdir ~/bag
cp -r ~/CougarsSetup/config ~/config

# Set up udev rules
sudo cp /home/frostlab/config/00-teensy.rules /etc/udev/rules.d/00-teensy.rules
sudo udevadm control --reload-rules
sudo udevadm trigger

echo "ALERT: Make sure to set the vehicle-specific params in "teensy_id.sh" and "vehicle_config.yaml" in "~/config" now"
