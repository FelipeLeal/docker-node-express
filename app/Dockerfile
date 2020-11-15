FROM node:alpine

ENV YARN_VERSION 1.5.1

RUN apk add --no-cache --virtual .build-deps-yarn curl \
    && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz \
    && apk del .build-deps-yarn

ENV APP=/home/node/app

WORKDIR $APP

RUN chown -R node:node $APP

COPY package*.json .

RUN npm cache clean --force

RUN npm install -g npm

RUN npm i --package-lock-only

RUN npm audit fix

USER node

EXPOSE 3000

CMD [ "npm", "run", "start" ]