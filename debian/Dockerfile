FROM debian:stretch-slim

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    libpq5 \
    locales \
    apt-transport-https \
    lsb-release \
    apt-utils \
    ca-certificates \
    openssh-client \
    curl \
    nano \
    git \
    wget \
    unzip \
	ntp \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN export TERM=xterm \
    && echo "export TERM=xterm" >> /root/.bashrc \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && ln -s /etc/locale.alias /usr/share/locale/locale.alias \
	&& locale-gen en_US en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && export TZ=America/Sao_Paulo \
    && ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && touch /etc/ntp.drift

RUN adduser --disabled-password --gecos '' developer \
    && usermod -aG sudo developer \
    && usermod -aG www-data developer \
    && mkdir /home/developer/workdir

WORKDIR /home/developer/workdir

COPY shared/ntp.conf /etc/ntp.conf