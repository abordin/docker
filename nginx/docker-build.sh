#!/bin/bash

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/nginx-proxy .

rm -rf shared