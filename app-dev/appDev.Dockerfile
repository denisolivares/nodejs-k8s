FROM alpine:3.12.1

RUN apk add --update nodejs npm

RUN addgroup -S node && adduser -S node -G node

USER node

WORKDIR /home/node/code

COPY --chown=node:node index.js .

CMD ["node", "index.js"]