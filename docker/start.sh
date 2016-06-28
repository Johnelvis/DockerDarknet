#!/bin/bash
echo "Starting Darknet Container..."

nvidia-docker stop darknet
nvidia-docker start darknet

nvidia-docker exec darknet /bin/sh -c "cd /opt/DockerDarknet/analyze;forever start server.js"
echo "Darknet Container is ready to use!"
