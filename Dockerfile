FROM debian:jessie
MAINTAINER Aurelio Jargas <verde@aurelio.net>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y bc curl lynx && \
    rm -rf /var/lib/apt/lists/*

ENV LC_ALL=C.UTF-8 \
    PATH=/app:$PATH \
    ZZPATH=/app/funcoeszz \
    ZZDIR=/app/zz \
    ZZTMPDIR=/tmp \
    PAGER=more

# User may want to preserve the functions cache
VOLUME /tmp

COPY funcoeszz /app/
COPY zz/ /app/zz/
WORKDIR /app

ENTRYPOINT ["bash", "funcoeszz"]
CMD ["--help"]
