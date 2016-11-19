[![Build Status](https://travis-ci.org/scorputty/couchpotato.svg?branch=master)](https://travis-ci.org/scorputty/couchpotato)

# Docker CouchPotato (Alpine Base)

This is a Dockerfile to set up "CouchPotato" - (https://couchpota.to/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/couchpotato/).
If you don't want to customize the container you can run it directly by typing the following commands.
```sh
export VOL_CONFIG="/Volumes/shares/docker/config/couchpotato"
export VOL_DATA="/Volumes/shares/docker/data"
export LOCAL_PORT="5050"

docker run -d -h $(hostname) \
  -v ${VOL_CONFIG}:/config \
  -v ${VOL_DATA}:/data \
  -p ${LOCAL_PORT}:5050 \
  --name=couchpotato --restart=always cryptout/couchpotato
```

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/couchpotato.git
cd couchpotato
./build.sh
```

### Variables
Change to match your situation.
```Dockerfile
ENV appUser="media"
ENV appGroup="1000"
```

### Volumes
Make sure to map the Volumes to match your situation.
```Dockerfile
VOLUME ["/config", "/data"]
```

### To run the container
Edit rundocker.sh (this will be replaced by docker-compose soon...).
```sh
./rundocker.sh
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
