#!/bin/bash

cd ./../nginx/

mkdir shared

cp ./../shared/* shared

mv ./shared/nginx-default-php ./shared/default

docker build -t jacksonveroneze/nginx-php .

rm ./shared/default

mv ./shared/nginx-default-balance ./shared/default

docker build -t jacksonveroneze/nginx-balance .

rm -rf shared