#Matching Node version 16
FROM node:16.20.2-buster

WORKDIR /usr/src/app

COPY example-frontend/. .

EXPOSE 5000/tcp

RUN npm install

RUN npm run build 

RUN npm install -g serve

RUN useradd -m appuser

RUN chown appuser .

USER appuser

CMD serve -s -l 5000 build