FROM debian:stretch-slim

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ America/Sao_Paulo

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    libpq5 \
    locales \
    apt-utils \
    ca-certificates \
    openssh-client \
    curl \
    nano \
    git \
    wget \
    unzip \
	ntp \
    ssh \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN export TERM=xterm \
    && echo "export TERM=xterm" >> /root/.bashrc \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
	&& locale-gen en_US en_US.UTF-8 \
    && touch /etc/ntp.drift \
    && export TZ=America/Sao_Paulo \
    && ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

RUN adduser --disabled-password --gecos '' www \
    && usermod -aG sudo www \
    && usermod -aG www-data www \
    && mkdir /home/www/workdir

COPY shared/ntp.conf /etc/ntp.conf