#!/bin/bash

AMI=ami-05ffe3c48a9991133
SG_ID=sg-050ef4889bc4a5a82
INSTANCES=("mongodb" "user")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    IP_ADDRESS=$(aws ec2 run-instances --image-id al2023-ami-2023.7.20250623.1-kernel-6.1-x86_64 --instance-type $INSTANCE_TYPE  --security-group-ids sg-050ef4889bc4a5a82)
   
    echo "$i: $IP_ADDRESS"
done
