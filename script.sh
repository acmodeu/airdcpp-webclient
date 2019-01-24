#!/bin/sh
chown "${PUID}:${PGID}" -R /airdcpp-webclient
if [ "$1" = "--configure" ]
then
	su-exec "${PUID}:${PGID}" /airdcpp-webclient/airdcppd $1
else
	su-exec "${PUID}:${PGID}" /airdcpp-webclient/airdcppd
fi
