# syntax=docker/dockerfile:1

#using node js image
FROM node:16

#create a working directory to copy all needed files
WORKDIR /app

#Copy package.json file and install necessary node packages
COPY package.json package.json
RUN npm install
# add npm ci for faster package installs during builds in production 
# RUN npm ci --only=production

COPY . .

EXPOSE 3000

# CMD [ "node", "index.js" ]
