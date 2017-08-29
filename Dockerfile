FROM node:6.9-slim

RUN curl -sS http://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install git
RUN apt-get update && apt-get upgrade -y && apt-get install -y git bzip2 libfontconfig1 yarn nfs-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prevent issues with private keys
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com

# Install yarn
RUN npm install -g -q \
    phantomjs-prebuilt \
    marked@0.3.5 \
    jshint@2.9.3 \
    node-gyp@3.4.0 \
    clean-css \
    https://github.com/hellofresh/lentil.git#fix/add-missing-babel-eslint

# Rebuild node-sass to avoid 
RUN npm -g -q rebuild node-sass
