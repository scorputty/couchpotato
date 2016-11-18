[![Build Status](https://travis-ci.org/scorputty/couchpotato.svg?branch=master)](https://travis-ci.org/scorputty/couchpotato)

#docker couchpotato

This is a Dockerfile to set up "CouchPotato" - (https://couchpota.to/)

Build from docker file

```
git clone https://github.com/scorputty/couchpotato.git
cd docker/couchpotato
./build.sh
```
- to run edit rundocker.sh
```
VOL_CONFIG="*your_config_location*"
VOL_DATA="*your_videos_location"
LOCAL_PORT="8080"
docker run -d -h $(hostname) -v ${VOL_CONFIG}:/config -v ${VOL_DATA}:/data -p 5050:5050 --restart=always --name couchpotato couchpotato
```
