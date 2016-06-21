#!/bin/bash
echo "Start Darknet Container"
nvidia-docker start darknet
echo "Start analyze tool"
nvidia-docker exec darknet /bin/sh -c "cd /opt/DockerDarknet/analyze;node server.js &"
echo "Darknet Container is ready to use!"