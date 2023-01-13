FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Website Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install apache2 dumb-init

EXPOSE 82

COPY ./tools ./var/www/html

COPY ./conf/apache2.conf /etc/apache2/apache2.conf

COPY ./conf/ports.conf /etc/apache2/ports.conf

RUN service apache2 restart

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]