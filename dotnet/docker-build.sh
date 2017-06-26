#!/bin/bash

mkdir shared

cp ./../shared/* shared

docker build -t jacksonveroneze/dotnet-core-sdk .

rm -rf shared