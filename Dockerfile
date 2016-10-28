FROM node:6.7
RUN git config --global url."https://github.com".insteadOf ssh://git@github.com
RUN npm install -g yarn
RUN yarn global add marked@0.3.5
RUN yarn global add jshint@2.9.3
RUN yarn global add node-gyp@3.4.0
RUN yarn global add phantomjs-prebuilt
RUN yarn global add https://github.com/hellofresh/lentil.git#fix/add-missing-babel-eslint


