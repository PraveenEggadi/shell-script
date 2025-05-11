#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$($line | awk '{print $6F}' | cut -d % -f1)
    partition=$( $line | awk '{print $1F}')
    if [ $usage -ge $partition ]
    then
        message+="High Disk usage alert on $partition:  $usage\n"
    fi
done <<< $DISK_USAGE

echo -e "message: $message"