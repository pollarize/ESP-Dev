#!/bin/bash

#Get name of the current user and set it to local variable
_user="$(id -u -n)"

#Set the sdk target folder
_sdk_folder='./esp-open-sdk'

#Get MAX RAM memory in KB
_phymem=$(awk -F":" '$1~/MemTotal/{print $2}' /proc/meminfo )

#Get CPU Architecture
_cpuarch="$(uname -m)"

echo "Welcome to ESP-SDK installation\n\n"


echo "The following script will setup the following things:"

echo "####################################################"
echo "# 1.ESP8266-Development toolchain files            #" 
echo "# 2.ESP8266-Official development kit with RTOS     #"
echo "# 3.ESP32-Prebuilt binaries used from SDK          #"
echo "# 4.ESP-IDF Latest SDK files                       #"
echo "####################################################"

echo "####################################################"
echo "# Check Compatibility of the system               #"
echo "####################################################"

echo "To Do - Not Implemented yet !!!"

echo "####################################################"
echo "# Install needed packages for SDK                  #"
echo "####################################################"

sudo -u $_user  apt-get install \
                make unrar-free autoconf \
                automake libtool gcc g++ gperf \
                flex bison texinfo gawk ncurses-dev 
				libexpat-dev python-dev python 
				python-serial \
                sed git unzip bash help2man wget bzip2 \
				libtool-bin  

echo "####################################################"
echo "# CLone OPEN SDK Files Recursivly                  #"
echo "####################################################"

git clone --recursive \
          https://github.com/pfalcon/esp-open-sdk.git

echo "####################################################"
echo "# Set owner of the SDK folder and set mode to 777  #"
echo "####################################################"

sudo -u $_user chown $_user $_sdk_folder \
               chmod 777 -R $_sdk_folder

echo "####################################################"
echo "# Enter in ESP-OPEN-SDK Folder                     #"
echo "####################################################"

cd $_sdk_folder

echo "####################################################"
echo "# Make DEFAULT = STANDALONE                        #"
echo "####################################################"

make STANDALONE=y
