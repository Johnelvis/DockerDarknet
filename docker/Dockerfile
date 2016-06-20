FROM nvidia/cuda

MAINTAINER Raphael Fritsch

WORKDIR /home

# Download latest version of the code and install dependencies
RUN apt-get update && apt-get install -y git nano curl

# Install Node for Analyzer and Scripts
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y
RUN npm i -g express

#Clone
RUN git clone https://github.com/cracker0dks/DockerDarknet

