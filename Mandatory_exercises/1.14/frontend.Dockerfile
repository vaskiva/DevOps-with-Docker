#Matching Node version 16
FROM node:16.20.2-buster

WORKDIR /usr/src/app

COPY . .

EXPOSE 5000/tcp

RUN npm install

RUN REACT_APP_BACKEND_URL=http://localhost:8080 npm run build 

RUN npm install -g serve

CMD serve -s -l 5000 build