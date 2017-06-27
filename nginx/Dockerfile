FROM debian:stretch-slim

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    locales \
    apt-utils \
    ca-certificates \
    curl \
    nano \
	ntp \
    nginx \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN export TERM=xterm \
    && echo "export TERM=xterm" >> /root/.bashrc \
    && touch /etc/ntp.drift \
    && adduser --disabled-password --gecos '' www \
    && usermod -aG sudo www \
    && usermod -aG www-data www \
    && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default \
    && mkdir /etc/nginx/ssl/

ADD shared/default /etc/nginx/sites-available/
ADD shared/certificate.crt /etc/nginx/ssl/
ADD shared/certificate.key /etc/nginx/ssl/
ADD shared/ntp.conf /etc/ntp.conf

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /home/www/workdir

EXPOSE 80 443

CMD nginx -g 'daemon off;'