#!/bin/sh

echo "Adding basic auth to nginx"
htpasswd -c -b -B /etc/nginx/.htpasswd $BASIC_USERNAME $BASIC_PASSWORD

echo "Starting nginx"
exec nginx -g "daemon off;"