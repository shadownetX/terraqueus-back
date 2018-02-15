FROM node:9-alpine

MAINTAINER Thomas THIEBAUDET <thomas@thiebaudet.fr>

RUN apk add --no-cache python make g++

WORKDIR /var/www/symfony

RUN npm install

CMD [ "npm", "start" ]
