#!/bin/bash

cd ./../php-nginx/

mkdir shared

cp -r ./../shared/* shared

mv ./shared/nginx-default-php ./shared/default

docker build -t jacksonveroneze/nginx-php .

rm ./shared/default