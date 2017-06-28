#!/bin/bash

cd ./../nginx/

mkdir shared

cp ./../shared/* shared

mv ./shared/nginx-default-php ./shared/default

docker build -t jacksonveroneze/nginx-php .

rm ./shared/default

mv ./shared/nginx-default-proxy ./shared/default

docker build -t jacksonveroneze/nginx-proxy .

rm -rf shared