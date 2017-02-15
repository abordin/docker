#!/bin/bash

cp ./../certs/* .

docker build -t jacksonveroneze/php7.0-fpm-nginx .

rm certificate.*