FROM nvidia/cuda

MAINTAINER Raphael Fritsch

WORKDIR /home

# Download latest version of the code and install dependencies
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y git nano curl build-essential wget libfaac-dev

#Clone
RUN git clone https://github.com/cracker0dks/DockerDarknet

RUN ./DockerDarknet/docker/nodeinstall.sh
RUN ./DockerDarknet/docker/openCVinstall.sh

RUN apt-get install nodejs -y
RUN npm i -g express

