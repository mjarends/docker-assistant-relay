FROM node:8-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apk add --no-cache git tzdata && \
	npm i pm2 -g && \
	git clone https://github.com/greghesp/assistant-relay.git --branch v3 && \
	cd assistant-relay/client && \
	npm install && \
	cd ../relay && \
	npm install && \
	apk del git

VOLUME assistant-relay-config-json:/assistant-relay/relay/bin/config.json
VOLUME assistant-relay-audio-response:/assistant-relay/relay/bin/audio-responses

EXPOSE 3000

WORKDIR /assistant-relay/relay
CMD npm run start
