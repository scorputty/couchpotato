#!/usr/bin/env bash

# edit for your situation
VOL_CONFIG="/Volumes/shares/docker/config/couchpotato"
VOL_DATA="/Volumes/shares/docker/data"
LOCAL_PORT="5050"

test -d ${VOL_CONFIG} || VOL_CONFIG="${PWD}${VOL_CONFIG}" && mkdir -p ${VOL_CONFIG}
test -d ${VOL_DATA} || VOL_DATA="${PWD}${VOL_DATA}" && mkdir -p ${VOL_DATA}

docker run -d -h $(hostname) \
  -v ${VOL_CONFIG}:/config \
  -v ${VOL_DATA}:/data \
  -p ${LOCAL_PORT}:5050 \
  --name=couchpotato --restart=always cryptout/couchpotato
