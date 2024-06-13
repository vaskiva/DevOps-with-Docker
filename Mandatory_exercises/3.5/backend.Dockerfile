FROM golang:1.16.15-alpine3.15

EXPOSE 8080

WORKDIR /usr/src/app

COPY example-backend/. .

RUN go build 

RUN adduser -H -D appuser 

RUN chown appuser .

USER appuser

ENTRYPOINT ./server 