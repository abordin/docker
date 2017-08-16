#!/bin/bash

cd ./../postgres9.4-ssl/

mkdir shared

cp -r ./../shared/* shared

docker build -t jacksonveroneze/postgres9.4-ssl .

rm -rf shared