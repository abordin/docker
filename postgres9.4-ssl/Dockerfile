FROM postgres:9.4

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

COPY ./ssl.conf /etc/postgresql-common/ssl.conf

RUN mkdir -p /var/ssl

COPY certificate.crt certificate.key /var/ssl/

RUN chown postgres:postgres \
    /var/ssl/certificate.crt \
    /var/ssl/certificate.key \
    && chmod 600 /var/ssl/certificate.key

COPY ssl.sh /docker-entrypoint-initdb.d/