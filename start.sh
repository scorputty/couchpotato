#!/bin/sh

# if /config doesnt exist, exit
test -d /config || exit 1
# same goes for data
test -d /data || exit 2

# WORKDIR should be /CouchPotatoServer
exec /usr/bin/python ./CouchPotato.py --data_dir /data/ --config_file=/config/CouchPotato.cfg --console_log
