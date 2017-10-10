FROM andersonbordin/debian-stretch-slim

LABEL maintainer="anderson@inovadora.com.br"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    nginx \
    && apt-get autoremove -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default \
    && mkdir /etc/nginx/ssl \
    && rm /etc/nginx/nginx.conf

ADD shared/default /etc/nginx/sites-available/
ADD shared/nginx.conf /etc/nginx/
ADD shared/nginx-shared.conf /etc/nginx/
ADD shared/certificate.crt /etc/nginx/ssl/
ADD shared/certificate.key /etc/nginx/ssl/

ADD shared/htpasswd-nginx /etc/nginx/

ADD shared/launch.sh /

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
    && chmod 775 /launch.sh

EXPOSE 443

CMD ["/launch.sh"]