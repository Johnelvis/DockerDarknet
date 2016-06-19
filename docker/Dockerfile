FROM ubuntu:14.04

MAINTAINER Raphael Fritsch

WORKDIR /opt

# Download latest version of the code and install dependencies
RUN  apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y git && \
  git clone https://github.com/cracker0dks/DockerDarknet
