#!/bin/bash

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/debian-stretch-slim .

rm -rf shared