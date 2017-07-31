#!/bin/bash

sed -i "s/__FPM_HOST_NAME__/$FPM_HOST_NAME/" /etc/nginx/sites-available/default
nginx -g 'daemon off;' 