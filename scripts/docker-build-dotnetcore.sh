#!/bin/bash

cd ./../dotnet/

mkdir -p shared

cp ./../shared/* shared

docker build -t jacksonveroneze/dotnet-core-sdk .

rm -rf shared