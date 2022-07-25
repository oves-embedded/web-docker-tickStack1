#!/bin/bash

# Change Directory to config on the folder
echo -e "\e[93m[*] \e[34mChanging Directory"
# cd mosquitto/config
# Downloading mosquitto inside the config folder
# Update and Upgrade packages
# echo -e "\e[93m[*] \e[34mUpdate and upgrade packages."
echo -e "\e[93m[*] \e[34mInstalling Mosquitto."
# mosquitto-2.0.12-install-windows-x64.exe /S
# apt-get update -y && apt-get upgrade -y && apt-get install mosquitto -y|
# Install wget
echo -e "\e[93m[*] \e[34mDownload wget package..."
# apt-get install wget -y|
# Start mosquitto
echo -e "\e[93m[*] \e[34mStart Mosquitto Broker..."
# mosquitto -v
echo -e "\e[93m[*] \e[34mInstalling jq."
# sudo apt-get install jq
# exitong from folder
echo -e "\e[93m[*] \e[34mExiting folder..."
# cd ../../
# Create files output and password.txt

echo -e "\e[93m[*] \e[34mRunning Mqtt script from js file"
node mqtt.js

# Encrypting the Password file
echo -e "\e[93m[*] \e[34mEncrypting password file"
mosquitto_passwd -U pwd.txt
echo -e "\e[93m[*] \e[34mPassword file Encrypted"
# Move created file
echo -e "\e[93m[*] \e[34mMoving file password.txt"
# mv password.txt ./mosquitto/config
echo "\e[93m[*] \e[34mFile Moved successfully"