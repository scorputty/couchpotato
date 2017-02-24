#!/usr/bin/env bash

# edit for your situation (config/couchpotato should be there)
VOL_SHARE="/Volumes/shares/docker/"

test -d ${VOL_SHARE} || VOL_SHARE="${PWD}${VOL_SHARE}" && mkdir -p ${VOL_SHARE}/config/couchpotato

docker run -d -h $(hostname) \
  -p 5050:5050 \
  -v ${VOL_SHARE}:/share \
  -e TZ="Europe/Amsterdam" \
  -e appUser="media" \
  -e appGroup="media" \
  -e PUID="10000" \
  -e PGID="10000" \
  --name=couchpotato --restart=always cryptout/couchpotato

# for troubleshooting run
# docker exec -it couchpotato /bin/bash
# to check logs run
# docker logs -f couchpotato
