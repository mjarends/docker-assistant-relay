FROM node:8-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apk add --no-cache git tzdata && \
	npm i pm2 -g && \
	git clone https://github.com/greghesp/assistant-relay.git && \
	cd assistant-relay && \
	git checkout v3 && \
	cd client &&\
	npm install && \
	cd ..\relay && \
	npm install && \
	apk del git

VOLUME /assistant-relay/server/configurations/secrets
VOLUME /assistant-relay/server/configurations/tokens
EXPOSE 3000

WORKDIR /assistant-relay/relay
CMD npm run start
