FROM microsoft/dotnet:1.1.2-sdk

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV ASPNETCORE_URLS http://0.0.0.0:5000

RUN adduser --disabled-password --gecos '' www \
    && usermod -aG sudo www \
    && usermod -aG www-data www \
    && mkdir -p /home/www/workdir \
    && chmod 777 /home/www/workdir

WORKDIR /home/www/workdir

EXPOSE 5000

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://0.0.0.0:5000"]