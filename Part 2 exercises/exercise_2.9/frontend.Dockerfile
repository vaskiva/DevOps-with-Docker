#Matching Node version 16
FROM node:16.20.2-buster

WORKDIR /usr/src/app

COPY frontend .

#EXPOSE 5000/tcp

RUN npm install

RUN npm run build

RUN REACT_APP_BACKEND_URL=http://nginx/api/ping npm install -g serve

CMD serve -s -l 5000 build