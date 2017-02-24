#!/bin/sh

# if /config doesnt exist, exit
test -d /share/config/couchpotato || exit 1
# same goes for data
test -d /share/media/Downloads/couchpotato || exit 2

cd /CouchPotatoServer

# get latest git data
git pull origin

# WORKDIR should be /CouchPotatoServer
exec /usr/bin/python ./CouchPotato.py --data_dir /share/media/Downloads/couchpotato --config_file=/share/config/couchpotato/CouchPotato.cfg --console_log
