#!/bin/bash

cd ./../debian/

mkdir -p shared

cp -r ./../shared/* shared

docker build -t jacksonveroneze/debian-stretch-slim .

rm -rf shared