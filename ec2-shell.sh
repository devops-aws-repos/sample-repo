#!/bin/bash

AMI=ami-0b4f379183e5706b9
SG_ID=sg-050ef4889bc4a5a82
INSTANCES=("mongodb" "user")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ]
    then
        instance_type="t3.small"
    else
        instance_type="t2.micro"
    fi

    IP_ADDRESS=$(aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type t2.micro  --security-group-ids sg-050ef4889bc4a5a82)
   
    echo "$i: $IP_ADDRESS"
done
