#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
MESSAGE=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')

    if [ $usage -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="High Disk Usage on $partition: $usage\n"
    fi
done <<< $DISK_USAGE

echo "message: $MESSAGE"