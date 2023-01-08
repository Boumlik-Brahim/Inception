FROM debian:buster

RUN apt-get update && apt-get install -y \
    wget \
    apache2 \
    php \
    php-mysql \
    libapache2-mod-php

RUN cd /var/www/html; rm -rf *;

RUN wget https://www.adminer.org/latest.php -O /var/www/html/index.php

COPY ./conf/apache2.conf /etc/apache2/apache2.conf

COPY ./conf/ports.conf /etc/apache2/ports.conf

RUN service apache2 restart

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]