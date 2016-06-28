#!/bin/bash
#echo "Building own Docker Image" #change the run line 9 as well!
#docker build -t dockerdarknet .

echo "Remove old Containers"
docker rm -f darknet 2>/dev/null

echo "Run new Container"
docker pull rofl256/dockerdarknet
nvidia-docker run -td -p 80:80 -v /opt/DockerDarknet:/opt/DockerDarknet --name "darknet" rofl256/dockerdarknet
echo "Clone repo inide Docker"
nvidia-docker exec darknet /bin/sh -c "cp -r /home/DockerDarknet /opt;cd /opt/DockerDarknet;git pull;make"
./start.sh

