#!/bin/bash

cd ./../php/

mkdir shared

cp ./../shared/* shared

docker build --no-cache -f Dockerfile7.0 -t jacksonveroneze/php7.0-fpm .

docker build --no-cache -f Dockerfile7.1 -t jacksonveroneze/php7.1-fpm .

rm -rf shared