#!/bin/bash

cp ./../certs/* .

docker build -t jacksonveroneze/postgres9.4-ssl .

rm certificate.*