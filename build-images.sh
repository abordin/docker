#!/bin/bash

cd php7.0-fpm-nginx
&& ./docker-build.sh \
&& cd ../php7.1-fpm-nginx \
&& ./docker-build.sh		
&& cd ../postgres9.4-ssl \
&& ./docker-build.sh