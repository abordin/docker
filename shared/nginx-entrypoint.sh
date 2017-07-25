#!/bin/bash

sed -i "s/__FPM_NAME__/$FPM_NAME/" /etc/nginx/sites-available/default
nginx -g 'daemon off;' 