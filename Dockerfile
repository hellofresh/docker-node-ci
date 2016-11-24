FROM node:6.7
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com
RUN npm install -g yarn
RUN yarn global add \
    marked@0.3.5 \
    jshint@2.9.3 \
    node-gyp@3.4.0 \
    phantomjs-prebuilt \
    https://github.com/hellofresh/lentil.git#fix/add-missing-babel-eslint

