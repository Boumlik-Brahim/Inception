FROM debian:buster

RUN apt-get -y update && apt-get -y install curl sendmail

RUN apt-get install -y php7.3-fpm php7.3-mysql 

EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN chmod +x script.sh

CMD [ "./script.sh" ]
