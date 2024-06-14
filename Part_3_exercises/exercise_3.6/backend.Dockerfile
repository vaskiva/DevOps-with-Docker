FROM golang:1.16.15-alpine3.15

EXPOSE 8080

WORKDIR /usr/src/app

COPY example-backend/. .

RUN go build && \ 
    adduser -H -D appuser && \
    chown appuser . && \
    rm .dockerignore .gitignore go.mod go.sum README.md app_test.go app.go

USER appuser

ENTRYPOINT ./server 