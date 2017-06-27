FROM microsoft/dotnet:1.1.2-sdk

MAINTAINER Jackson Veroneze <jackson@jacksonveroneze.com>

ENV ASPNETCORE_URLS http://0.0.0.0:5000

RUN adduser --disabled-password --gecos '' developer \
    && usermod -aG sudo developer \
    && usermod -aG www-data developer \
    && mkdir -p /home/developer/workdir \
    && chmod 777 /home/developer/workdir

WORKDIR /home/developer/workdir

EXPOSE 5000

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://0.0.0.0:5000"]