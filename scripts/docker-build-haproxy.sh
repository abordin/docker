#!/bin/bash

cd ./../haproxy/

mkdir -p shared

cp ./../shared/* shared

docker build -t jacksonveroneze/haproxy .

rm -rf shared