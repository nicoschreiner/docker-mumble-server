#!/bin/bash

if [ ! -f /data/mumble-server.ini ]
then
   sed -i 's/var.log.mumble-server/data/' /etc/mumble-server.ini
   sed -i 's/var.lib.mumble-server/data/' /etc/mumble-server.ini
   cp /etc/mumble-server.ini /data
   chown -R mumble-server:mumble-server /data
fi

exec /usr/sbin/murmurd -fg -ini /data/mumble-server.ini

exit 0
