FROM nvidia/cuda

MAINTAINER Raphael Fritsch

WORKDIR /home

# Download latest version of the code and install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y git nano

# Install Node for Analyzer and Scripts
RUN apt-get install curl -y && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install nodejs -y && \
 npm i -g express

#Clone
RUN git clone https://github.com/cracker0dks/DockerDarknet

