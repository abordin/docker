FROM postgres:9.4

LABEL maintainer="anderson@inovadora.com.br"

COPY ./shared/postgres-ssl.conf /etc/postgresql-common/ssl.conf

RUN mkdir -p /var/ssl

COPY ./shared/certificate.crt shared/certificate.key /var/ssl/

RUN chown postgres:postgres \
    /var/ssl/certificate.crt \
    /var/ssl/certificate.key \
    && chmod 600 /var/ssl/certificate.key

COPY ./shared/postgres-ssl.sh /docker-entrypoint-initdb.d/