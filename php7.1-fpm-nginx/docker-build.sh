#!/bin/bash

source variables-ambient.sh

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/php7.1-fpm-nginx .

rm -rf shared