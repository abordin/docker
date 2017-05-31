FROM debian:stretch

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN export TERM=xterm \
    && export XDEBUG_CONFIG="idekey=dbgp" \
    && echo "export TERM=xterm" >> /root/.bashrc \
    && echo "export XDEBUG_CONFIG=\"idekey=dbgp\"" >> /root/.bashrc \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get upgrade -y \
    && apt-get -y --no-install-recommends install \
    locales \
    apt-utils \
    ca-certificates \
    openssh-client \
    curl \
    nano \
    git \
    nginx \
    supervisor \
    php7.0-dev \
    php7.0-cli \
    php7.0-intl \
    php-soap \
    php7.0-json \
    php7.0-curl \
    php7.0-fpm \
    php-pear \
    php7.0-gd \
    php7.0-zip \
    php7.0-pgsql \
    php7.0-mysql \
    php7.0-mcrypt \
    php7.0-mbstring \
    php7.0-memcached \
    php7.0-memcache \
    php7.0-xdebug \
    php7.0-ldap \
    php7.0-imagick \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/;date.timezone =/date.timezone = America\/Sao_Paulo/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/short_open_tag = On/short_open_tag = Off/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/short_open_tag = On/short_open_tag = Off/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/display_errors = Off/display_errors = On/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/display_errors = Off/display_errors = On/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/display_startup_errors = Off/display_startup_errors = On/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/display_startup_errors = Off/display_startup_errors = On/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/log_errors = Off/log_errors = On/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/log_errors = Off/log_errors = On/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 5000M/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/7.0/cli/php.ini \
    && sed -i "s/post_max_size = 8M/post_max_size = 5000M/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = 0.0.0.0/" /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i "s/listen = \/run\/php\/php7\.0\-fpm\.sock/listen = \/var\/run\/php\/php7.0-fpm.sock/" /etc/php/7.0/fpm/pool.d/www.conf

RUN adduser www \
    && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default \
    && mkdir /etc/nginx/ssl/ \
    && mkdir -p /var/run/php \
    && rm /etc/php/7.0/mods-available/xdebug.ini

ADD shared/default /etc/nginx/sites-available/

ADD shared/certificate.crt /etc/nginx/ssl/

ADD shared/certificate.key /etc/nginx/ssl/

ADD shared/xdebug.ini /etc/php/7.0/mods-available

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD shared/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD shared/start.sh /

RUN sed -i "s/___PHP_VERSION___/7.0/" /etc/supervisor/conf.d/supervisord.conf \
    && sed -i "s/___PHP_VERSION___/7.0/" /etc/nginx/sites-available/default

WORKDIR /home/www/workdir

EXPOSE 80 443

CMD ["/bin/bash", "/start.sh"]