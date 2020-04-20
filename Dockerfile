FROM python:3-slim-buster

ARG RELEASE_VERSION=3.3.2b

LABEL maintainer "Mitch Arends <mjarends@gmail.com>"

# install the command line tools needed
RUN apt-get update && apt-get install -y \
		curl \
		unzip \
		tzdata \
	&& rm -rf /var/lib/apt/lists/*

# install Node.js and PM2
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get install -y nodejs && \
	npm i pm2 -g


# Create app directory
WORKDIR /usr/src/app

# install Google assistant relay
RUN curl -OL https://github.com/greghesp/assistant-relay/releases/download/v${RELEASE_VERSION}/release.zip && \
	ls -l && \
	unzip release.zip && \
	rm release.zip && \
	ls -l && \
	npm install

EXPOSE 3000

CMD npm run start
