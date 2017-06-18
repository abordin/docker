#!/bin/bash

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/postgres9.4-ssl .

rm -rf shared