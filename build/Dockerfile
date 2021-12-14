FROM debian:latest as dictBuild

LABEL Description="Dictionary server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yy apt-utils locales dialog
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN apt-get update && apt-get install -yy dictd* dict-* && apt-get clean && rm -rf /var/lib/apt/lists/*

FROM dictBuild

LABEL Description="Dictionary server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"

COPY ./etc/dictd/. /etc/dictd/
COPY ./etc/default/dictd /etc/default/dictd

RUN mkdir -p /var/log/dictd && touch /var/log/dictd/server.log && chmod -Rfv 777 /etc/dictd /var/log/dictd

EXPOSE 2628

VOLUME [ "/config" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s CMD [ "ps -ux | grep '[d]ict$'" ]

ENV HOSTNAME dictd

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
