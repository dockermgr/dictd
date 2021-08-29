FROM debian

LABEL Description="dictd server" Vendor="Casjays Developments" Version="0.1"
LABEL org.casjaysdev.image.authors="git-admin@casjaysdev.com"


RUN apt-get update && \
    apt-get install -yy dict* && \
    apt-get clean

COPY ./etc/* /etc/
COPY ./usr/* /usr/
COPY ./var/* /var/

VOLUME /var/log/dictd

EXPOSE 2628 

CMD ["dictd", "-dnodetach"]
