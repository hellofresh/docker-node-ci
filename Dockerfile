FROM node:6.9-slim

# Prevent issues with private keys
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com

# Install yarn
RUN npm install -g yarn

# Add some packages we need
RUN yarn global add \
    marked@0.3.5 \
    jshint@2.9.3 \
    node-gyp@3.4.0 \
    phantomjs-prebuilt \
    https://github.com/hellofresh/lentil.git#fix/add-missing-babel-eslint

# Clean yarn cache to reduce image size
RUN yarn cache clean
