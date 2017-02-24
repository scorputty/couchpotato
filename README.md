[![Build Status](https://travis-ci.org/scorputty/couchpotato.svg?branch=master)](https://travis-ci.org/scorputty/couchpotato)[![](https://images.microbadger.com/badges/image/cryptout/couchpotato.svg)](https://microbadger.com/images/cryptout/couchpotato "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cryptout/couchpotato.svg)](https://microbadger.com/images/cryptout/couchpotato "Get your own version badge on microbadger.com")

# Docker CouchPotato (Alpine)

This is a Dockerfile to build "CouchPotato" - (https://couchpota.to/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/couchpotato/).

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/couchpotato.git
cd couchpotato
./build.sh
```

### WebGUI
To reach the WebGUI go to - (http://localhost:5050).
Or replace localhost with your target IP.

## Info
* Shell access whilst the container is running: `docker exec -it couchpotato /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f couchpotato`

# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
