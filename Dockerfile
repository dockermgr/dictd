FROM debian

LABEL Description="dictd server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"


RUN apt-get update && \
    apt-get install -yy dict* && \
    apt-get clean

COPY ./system/config/* /etc/dictd/
COPY ./system/config/dictd.conf /etc/dictd.conf
COPY ./system/data/* /usr/share/

VOLUME /etc/dictd
VOLUME /usr/share/dictd
VOLUME /var/log/dictd

EXPOSE 2628 

CMD ["dictd", "-dnodetach --verbose --log /var/log/dictd/dictd.log"]
