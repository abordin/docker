#!/bin/bash

cd .\..\postgres9.4-ssl\

mkdir shared

copy .\..\shared\* shared

docker build -t andersonbordin/postgres9.4-ssl .

Remove-Item shared -recurse

cd .\..\scripts