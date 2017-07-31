#!/bin/bash	

echo -e "\n\nsource /home/$USER/www/docker/environment-variables.sh" >> /home/$USER/.bashrc

source /home/$USER/.bashrc

sh -x build-environment.sh

cd scripts

sh -x docker-build-debian.sh
sh -x docker-build-haproxy.sh
sh -x docker-build-nginx.sh
sh -x docker-build-php.sh
sh -x docker-build-postgres.sh