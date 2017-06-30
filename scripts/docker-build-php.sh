#!/bin/bash

cd ./../php/

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/php7.0-fpm .

docker build -f Dockerfile7.1 -t jacksonveroneze/php7.1-fpm .

rm -rf shared