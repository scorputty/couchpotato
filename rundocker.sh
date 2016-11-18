#!/usr/bin/env bash

# edit for your situation
VOL_CONFIG="/Volumes/shares/docker/config/couchpotato"
VOL_DATA="/Volumes/shares/docker/data"
LOCAL_PORT="5050"

test -d ${VOL_CONFIG} || VOL_CONFIG="${PWD}${VOL_CONFIG}" && mkdir -p ${VOL_CONFIG}
test -d ${VOL_DATA} || VOL_DOWNLOADS="${PWD}${VOL_DATA}" && mkdir -p ${VOL_DATA}

docker run -d -h $(hostname) \
  -v ${VOL_CONFIG}:/config \
  -v ${VOL_DATA}:/data \
  -p ${LOCAL_PORT}:5050 \
  --restart=always scorputty/couchpotato
# for troubleshooting use this start command to get a shell
# docker run -ti -h $(hostname) \
#   -v ${VOL_CONFIG}:/config \
#   -v ${VOL_DATA}:/data \
#   -p ${LOCAL_PORT}:5050 \
#   --restart=always scorputty/couchpotato /bin/sh
