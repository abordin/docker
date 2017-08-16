#!/bin/bash	

source /home/$USER/www/docker/environment-variables.sh
#
alias docker-clear='docker rm -f `docker ps -aq`'
#
alias docker-clear-images='docker rmi $(docker images -f "dangling=true" -q)'
#
alias docker-gmus='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmus.yml -p gmus up -d'
alias docker-gmas='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmas.yml -p gmas up -d'
#
alias docker-gmas-api='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmas-api.yml -p gmas-api up -d'
#
alias docker-gmus-crypt='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmus-crypt.yml -p gmus-crypt up -d'
alias docker-gmas-crypt='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmas-crypt.yml -p gmas-crypt up -d'