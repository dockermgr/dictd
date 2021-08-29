FROM debian:latest

LABEL Description="dictd server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yy apt-utils locales dialog
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN apt-get update && apt-get install -yy dictd* dict-*
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./etc/dictd/. /etc/dictd/
COPY ./etc/default/dictd /etc/default/dictd

RUN chmod -fv 777 /etc/dictd && chmod 666 -Rfv /etc/dictd

VOLUME /var/log/dictd

EXPOSE 2628

CMD ["dictd", "-dnodetach -v"]
