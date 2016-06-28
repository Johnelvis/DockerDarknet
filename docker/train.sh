#!/bin/bash
echo "-TRAIN DARKNET-"
CONFIGFILE=$1
shift;
WIGHTFILE=$1
./createTrainTxt.sh
docker exec darknet /bin/sh -c "cd /opt/DockerDarknet;./darknet yolo train $CONFIGFILE $WIGHTFILE"