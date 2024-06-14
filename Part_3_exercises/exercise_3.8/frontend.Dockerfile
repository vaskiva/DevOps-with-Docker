#Matching Node version 16
FROM node:16.20.2-alpine3.18 as build-stage

WORKDIR /usr/src/app

COPY example-frontend/. .

RUN npm install && \
    npm run build

#Final stage starts here
FROM node:16.20.2-alpine3.18

EXPOSE 5000/tcp

WORKDIR /usr/src/app

COPY --from=build-stage /usr/src/app/build build

RUN npm install -g serve && \
    adduser -H -D appuser && \
    chown appuser .

USER appuser    

CMD serve -s -l 5000 build