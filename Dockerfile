FROM python:3-slim-buster

LABEL maintainer "Mitch Arends <mjarends@gmail.com>"

# install the command line tools needed
RUN apt-get update && apt-get install -y \
		curl \
		git \
		tzdata \
	&& rm -rf /var/lib/apt/lists/*

# install Node.js
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get install -y nodejs

# install Google assistant relay
RUN npm i pm2 -g && \
	git clone https://github.com/greghesp/assistant-relay.git --branch v3 && \
	cd assistant-relay/client && \
	npm install && \
	cd ../relay && \
	npm install

EXPOSE 3000

WORKDIR /assistant-relay/relay
CMD npm run start
