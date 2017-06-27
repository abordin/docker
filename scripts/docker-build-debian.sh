#!/bin/bash

cd ./../debian/

mkdir -p shared

cp ./../shared/* shared

docker build -t jacksonveroneze/debian-stretch-slim .

rm -rf shared