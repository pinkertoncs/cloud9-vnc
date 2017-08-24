#!/bin/bash

#Request sudo permissions
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
   exit 1
fi

#Get prerequisites

#sudo apt-get update 
sudo apt install -y supervisor xvfb fluxbox x11vnc websockify

#Copy supervisord configuration to proper configuration directory
cp supervisord.conf ${HOME}/.config/supervisord.conf

#Create the proper directory for the script
sudo mkdir /opt/c9vnc

#Make sure that the runners folder exists
mkdir ${HOME}/workspace/.c9/runners

#Copy the C9 runner to the C9 watch folder
cp c9vnc.run ${HOME}/workspace/.c9/runners/c9vnc.run

#Copy the run script to proper /opt/ directory
sudo cp run.sh /opt/c9vnc/c9vnc.sh

#Copy the run script to proper /opt/ directory
sudo cp uninstall.sh /opt/c9vnc/uninstall.sh

#Support password for x11vnc
sudo cp x11vncrun.sh /opt/c9vnc/x11vncrun.sh

#Clone noVNC into proper /opt/ directory
git clone https://github.com/kanaka/noVNC /opt/noVNC/

#force use to set a password to the vnc session
x11vnc -storepasswd
