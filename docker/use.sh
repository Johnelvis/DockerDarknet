#!/bin/bash
echo "-USE DARKNET-"
CONFIGFILE=$1
shift
WHIGHFILE=$1
shift

while [ "$1" != "" ]; do
    case $1 in
        -thresh )        shift
                THRESH=$1
                shift
                ;;
    * ) IMAGE=$1
                shift
        esac
done

if [ -z ${THRESH+x} ]; then
    docker exec darknet /bin/sh -c "cd /opt/DockerDarknet;./darknet yolo test $CONFIGFILE $WHIGHFILE $IMAGE"
else
    docker exec darknet /bin/sh -c "cd /opt/DockerDarknet;./darknet yolo test $CONFIGFILE $WHIGHFILE $IMAGE -thresh $THRESH"
fi
