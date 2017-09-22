#!/bin/bash

sed -i "s/__FORWARD_HOST__/$FORWARD_HOST/" /etc/nginx/sites-available/default
sed -i "s/__FORWARD_PORT__/$FORWARD_PORT/" /etc/nginx/sites-available/default

nginx -g "daemon off;"