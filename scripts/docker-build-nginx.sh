#!/bin/bash

cd ./../nginx/

mkdir shared
cp ./../shared/* shared


# nginx-balance
mv ./shared/entrypoint-nginx-balance.sh ./shared/launch.sh
mv ./shared/nginx-default-balance ./shared/default
docker build -t jacksonveroneze/nginx-balance .

# nginx-proxy
mv ./shared/entrypoint-nginx-proxy.sh ./shared/launch.sh
mv ./shared/nginx-default-proxy ./shared/default
docker build -t jacksonveroneze/nginx-proxy .


# nginx-proxy-basic-auth
mv ./shared/entrypoint-nginx-proxy.sh ./shared/launch.sh
mv ./shared/nginx-default-proxy-basic-auth ./shared/default
docker build -t jacksonveroneze/nginx-proxy-basic-auth .


rm -rf shared