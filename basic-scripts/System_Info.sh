#!/bin/bash

#----------------------------------------------
#script Name : system_Info.sh 
#Description: shows basic system information 
#Author: Mohamed salah Owida 
#----------------------------------------------

echo "==========================="
echo " system Information Reprot "
echo "==========================="


#Hostname 
echo "Hostname: $(hostname)"
echo "---------------------------------------------------------------------"

#Operating system and kernel version 
echo "OS Info: $(uname -srvmo)"
echo "---------------------------------------------------------------------"

#IP address (first non-loopback IPv4)
IP=$(hostname -I | awk '{print $1}')
echo "IP Address: $IP"
echo "---------------------------------------------------------------------"

#Uptime 
echo "Uptime: $(uptime -p)"
echo "---------------------------------------------------------------------"

#memory usage 
echo " memory usage:"
free -h 
echo "---------------------------------------------------------------------"


#Disk usage 
echo "Disk Usage:"
df -h | grep "^/dev"
echo "---------------------------------------------------------------------"


#CPU Info 
echo "CPU Info : $(lscpu | grep 'Model name' | awk -F: '{print $2}' |sed 's/^ *//')"
echo "---------------------------------------------------------------------"

#Logged in users 
echo "Logged-in Users: $(who | wc -l )"


echo "=============================================="


