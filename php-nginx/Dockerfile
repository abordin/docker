FROM jacksonveroneze/debian-stretch-slim

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    nginx \
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
    php7.0-redis \
    php7.0-xdebug \
    php7.0-ldap \
    php7.0-imagick \
    php7.0-bcmath \
    php7.0-interbase \
    php-pecl-http \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN export XDEBUG_CONFIG="idekey=dbgp" \
    && echo "export XDEBUG_CONFIG=\"idekey=dbgp\"" >> /home/developer/.bashrc \
    && mkdir -p /var/run/php \
    && rm /etc/php/7.0/mods-available/xdebug.ini \
    && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default \
    && mkdir /etc/nginx/ssl \
    && rm /etc/nginx/nginx.conf

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
    && sed -i "s/session.save_handler = files/session.save_handler = memcached/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/;session.save_path = \"\/var\/lib\/php\/sessions\"/session.save_path = memcached_session:11211/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/;session.lazy_write = On/session.lazy_write = Off/" /etc/php/7.0/fpm/php.ini \
    && sed -i "s/;request_terminate_timeout = 0/request_terminate_timeout = 180000/" /etc/php/7.0/fpm/pool.d/www.conf \
    && echo "memcached.sess_lock_retries = 30 * 1000 / 150" >> /etc/php/7.0/fpm/php.ini \
    && echo "memcached.sess_locking = 0" >> /etc/php/7.0/fpm/php.ini \
    && pecl install apcu \
    && echo "extension=apcu.so" > /etc/php/7.0/mods-available/apcu.ini \
    && phpenmod apcu

ADD shared/xdebug.ini /etc/php/7.0/mods-available
ADD shared/sg-7.0.ini /etc/php/7.0/mods-available/sg.ini
ADD shared/ixed.7.0.lin /usr/lib/php/20151012/ixed.7.0.lin
ADD shared/default /etc/nginx/sites-available/
ADD shared/nginx.conf /etc/nginx/
ADD shared/nginx-shared.conf /etc/nginx/
ADD shared/certificate.crt /etc/nginx/ssl/
ADD shared/certificate.key /etc/nginx/ssl/
ADD shared/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer \
    && phpenmod sg

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]