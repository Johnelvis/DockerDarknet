FROM ubuntu:14.04

MAINTAINER Raphael Fritsch

WORKDIR /opt

# Download latest version of the code and install dependencies
RUN  apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y git && \
  git clone https://github.com/cracker0dks/DockerDarknet

# Install Node for Analyzer and Scripts
RUN apt-get install curl -y && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs -y && \
 npm i -g express
