#!/bin/sh -e

FILE="/etc/rsyslog.d/rsyslog.conf"

mkdir -p $(dirname $FILE)

while [ ! -f "${FILE}" ]; do
    echo "waiting for ${FILE}"
    sleep 1
done

exec /docker-entrypoint.sh /usr/sbin/rsyslogd -n -f /etc/rsyslog.conf
