FROM nginx

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

RUN rm /etc/nginx/conf.d/default.conf \
    && mkdir /etc/nginx/ssl

ADD default.conf /etc/nginx/conf.d/
ADD shared/certificate.crt /etc/nginx/ssl/
ADD shared/certificate.key /etc/nginx/ssl/

EXPOSE 443