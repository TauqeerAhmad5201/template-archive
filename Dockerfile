FROM node:21-alpine3.18

WORKDIR /app

COPY package*.json .

RUN npm i

COPY ./license.config.json .

RUN npm install -g @accordproject/cicero-cli

COPY . .

RUN npm run pretest

RUN npm run test

RUN npm run coverage