FROM nvidia/cuda

MAINTAINER Raphael Fritsch

WORKDIR /home

# Download latest version of the code and install dependencies
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y git nano curl build-essential

#Clone
RUN git clone https://github.com/cracker0dks/DockerDarknet

RUN sh ./DockerDarknet/docker/installnode.sh
RUN apt-get install -y
RUN npm i -g express

