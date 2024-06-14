FROM golang:1.16.15-alpine3.15 as build-stage

WORKDIR /go/src/app

COPY example-backend/. .

RUN mkdir -p /go/bin/app && \
    CGO_ENABLE=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s" -o /go/bin/app/ -v . 

RUN echo "appuser:x:10001:10001:App User:/:/sbin/nologin" > /etc/minimal-passwd    

#Final-stage starts here
FROM scratch

COPY --from=build-stage /go/bin/app/server /server

COPY --from=build-stage /etc/minimal-passwd /etc/passwd

USER appuser

ENTRYPOINT ["/server"] 