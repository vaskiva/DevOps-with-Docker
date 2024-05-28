FROM golang:1.16.15-alpine3.15

EXPOSE 8080

ENV REQUEST_ORIGIN=http://frontend

WORKDIR /usr/src/app

COPY backend .

RUN go build 

ENTRYPOINT ./server