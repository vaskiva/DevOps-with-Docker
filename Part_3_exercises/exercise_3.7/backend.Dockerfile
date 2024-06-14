FROM golang:1.16.15-alpine3.15

EXPOSE 8080

WORKDIR /usr/src/app

COPY example-backend/. .

RUN go build && \ 
    adduser -H -D appuser && \
    chown appuser .

USER appuser

ENTRYPOINT ./server 