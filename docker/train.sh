#!/bin/bash
echo "-TRAIN DARKNET-"
CONFIGFILE=$1
eval `docker exec -i -t darknet ps aux | grep server | grep -v server | awk '{print "darknet exec -i -t darknet kill " $2}'`
docker exec darknet /bin/sh -c "cd /opt/DockerDarknet/analyze;node server.js &"
docker exec darknet /bin/sh -c "cd /opt/DockerDarknet;./darknet yolo train $CONFIGFILE"