FROM golang:1.16.15-alpine3.15

EXPOSE 8080

ENV REQUEST_ORIGIN=http://localhost:5000

WORKDIR /usr/src/app

COPY . .

RUN go build 

ENTRYPOINT ./server