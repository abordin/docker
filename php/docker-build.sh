#!/bin/bash

source variables-ambient.sh

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/php7.0-fpm .

rm -rf shared