FROM debian:stretch-slim

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive

ENV LANGUAGE pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8
ENV LC_CTYPE pt_BR.UTF-8
ENV TZ America/Sao_Paulo

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    apt-utils \
    libpq5 \
    locales \
    apt-transport-https \
    lsb-release \
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
    && echo 'pt_BR.UTF-8 UTF-8' >> /etc/locale.gen \
    && ln -s /etc/locale.alias /usr/share/locale/locale.alias \
	&& locale-gen pt_BR pt_BR.UTF-8 \
    && dpkg-reconfigure -f noninteractive locales \
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

ENV LC_ALL pt_BR.UTF-8
ENV LANGUAGE pt_BR:en