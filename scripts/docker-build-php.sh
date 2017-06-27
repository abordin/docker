#!/bin/bash

cd ./../php/

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/php7.0-fpm .

rm -rf shared