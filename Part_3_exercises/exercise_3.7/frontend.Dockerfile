#Matching Node version 16
FROM node:16.20.2-alpine3.18

WORKDIR /usr/src/app

COPY example-frontend/. .

EXPOSE 5000/tcp

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -H -D appuser && \
    chown appuser . && \
    rm package-lock.json package.json README.md .dockerignore .gitignore

USER appuser

CMD serve -s -l 5000 build