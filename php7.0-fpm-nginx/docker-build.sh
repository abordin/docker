#!/bin/bash

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/php7.0-fpm-nginx .

rm -rf shared