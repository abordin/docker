#!/bin/bash	

source /home/$USER/www/docker/environment-variables.sh
#
alias docker-clear='docker rm -f `docker ps -aq`'
#
alias docker-gmus='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmus.yml -p gmus up -d'
alias docker-gmas='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmas.yml -p gmas up -d'
#
alias docker-gmus-crypt='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmus-crypt.yml -p gmus-crypt up -d'
alias docker-gmas-crypt='docker-compose -f /home/$USER/www/docker/yml/docker-compose-gmas-crypt.yml -p gmas-crypt up -d'
#
alias docker-eschool='docker-compose -f /home/$USER/www/docker/yml/docker-compose-eschool.yml -p eschool up -d'