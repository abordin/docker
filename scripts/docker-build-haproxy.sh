#!/bin/bash

cd ./../haproxy/

mkdir -p shared

cp -r ./../shared/* shared

docker build -t jacksonveroneze/haproxy .

rm -rf shared