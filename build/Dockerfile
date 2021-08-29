FROM debian

LABEL Description="dictd server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
RUN apt-get update && apt-get install -yy dictd dialog locales dict*
RUN apt-get clean && rm -rf /var/lib/apt/lists/* 

COPY ./etc/dictd/. /etc/dictd/
COPY ./etc/default/dictd /etc/default/dictd
COPY ./usr/share/dict/. /usr/share/dict/
COPY ./usr/share/dictd/. /usr/share/dictd/
COPY ./var/lib/dictd/. /var/lib/dictd/
COPY ./var/lib/dictionaries-common/. /var/lib/dictionaries-common

VOLUME /var/log/dictd

EXPOSE 2628 

CMD ["dictd", "-dnodetach -v"]
