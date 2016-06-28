#!/bin/bash
nvidia-docker exec darknet /bin/sh -c "cd /opt/DockerDarknet/analyze;node server.js &"
