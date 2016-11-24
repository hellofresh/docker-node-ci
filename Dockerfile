FROM node:6.9-slim

# Install git
RUN apt-get update && apt-get install -y git bzip2 libfontconfig1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Prevent issues with private keys
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com

# Install yarn
RUN npm install -g -q \
    yarn \
    phantomjs-prebuilt

# Add some packages we need
RUN yarn global add \
    marked@0.3.5 \
    jshint@2.9.3 \
    node-gyp@3.4.0 \
    clean-css \
    https://github.com/hellofresh/lentil.git#fix/add-missing-babel-eslint

# Clean yarn cache to reduce image size
RUN yarn cache clean
