FROM node:8.1.3-slim

RUN apt-get update && apt-get install -y bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get remove libcurl3-gnutls \
    && apt-cache policy libcurl3-gnutls \
    && apt-get -t=jessie install libcurl3-gnutls -y \
    && apt-mark hold libcurl3-gnutls

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y git \
    && apt-get clean all

# Prevent issues with private keys
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com

RUN npm install -g yarn@latest

RUN yarn global add \
    eslint \
    jshint@2.9.3
