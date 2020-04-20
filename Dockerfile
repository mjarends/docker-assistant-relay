FROM python:3-slim-buster

LABEL maintainer "Mitch Arends <mjarends@gmail.com>"

# install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get install -y nodejs

# install Google assistant relay
RUN apt-get update && \
	apt-get install -y git tzdata && \
	npm i pm2 -g && \
	git clone https://github.com/greghesp/assistant-relay.git --branch v3 && \
	cd assistant-relay/client && \
	npm install && \
	cd ../relay && \
	npm install && \
	apk del git

EXPOSE 3000

WORKDIR /assistant-relay/relay
CMD npm run start
