#!/bin/bash

# Install ROS?

# Install ROS tools - colcon, rosdep, vcstool etc
sudo apt-get install python3-colcon-common-extensions python3-rosdep python3-vcstool
sudo rosdep init
rosdep update

# Get Taskflow
sudo add-apt-repository ppa:ros-industrial/ppa
sudo apt-get update
sudo apt-get install taskflow

# Move to and vcstool dep_ws
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/deps_ws/src
vcs import < deps.rosinstall

# Move to, vcstool, and rosdep ros1_ws
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/ros1_ws/src
vcs import < ros1.rosinstall
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/ros1_ws
rosdep install --from-paths src --ignore-src --rosdistro noetic -r -y

# Move to, vcstool, and rosdep ros2_ws
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/ros2_ws/src
vcs import < ros2.rosinstall
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/ros2_ws
rosdep install --from-paths src --ignore-src --rosdistro foxy -r -y

# Move to, vcstool, and rosdep bridge_ws
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/bridge_ws/src

vcs import < bridge.rosinstall
cd /home/lbayewallace/repos/automate22/roscon_workshop_2021/bridge_ws
rosdep install --from-paths src --ignore-src --rosdistro foxy -r -y
