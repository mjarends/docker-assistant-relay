# docker-assistant-relay

First time setup:

1. Create the following folder and temp config.json
```
/path/to/host/folder
	/audio-responses
	/config/config.json
```
2. Run the following docker command:
```
docker run -d \
	-p 3000:3000 \
	--name google-assistant-relay \
	--restart always \
	-v  path/to/host/folder/config/config.json:/assistant-relay/relay/bin/config.json \
	-v  path/to/host/folder/audio-responses:/assistant-relay/relay/bin/audio-responses \
	mjarends/docker-assistant-relay
```
3. Go to http://localhost:3000 and follow the on screen instructions to setup Google Assistant Relay

Based on v3.x of [greghesp/assistant-relay](https://github.com/greghesp/assistant-relay)
