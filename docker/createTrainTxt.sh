#!/bin/bash
echo "Create train.txt";
docker exec darknet /bin/sh -c "cd /opt/DockerDarknet/scripts;node createTrainTxt.js"