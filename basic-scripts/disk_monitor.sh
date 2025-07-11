#!/bin/bash 

#-------------------------------------
#script Name : disk_monitor.sh
#Description : Monitors disk usage and warns
#Author      : Mohamed salah Owida 
#-------------------------------------


# set your usage threshold (%)

THRESHOLD=80

echo "============================"
echo " Disk Usage Monitor Script" 
echo "   threshokd: ${THRESHOLD}%"
echo "============================"

#Get disk usage info for all mounted partitions under /dev
df -H | grep '^/dev' | while read  line; do 

#Extract fields 
USAGE=$(echo $line | awk '{print $5}' | sed 's/%//')
PARTITION=$(echo $line | awk '{print $1}')
MOUNTPOINT=$(echo $line | awk '{print $6}')

#check usage and set color 

if [ $USAGE -ge $THRESHOLD ]; then 
	COLOR="\033[0;31m" #Red
	STATUS="Warning" 
else
	COLOR="\033[0;32m" #Green
	STATUS="OK"
fi

#Print result 
echo -e "${COLOR}${STATUS}:${USAGE}% used on ${PARTITION} mounted on ${MOUNTPOINT}\033[0M"

echo "============================"
done
