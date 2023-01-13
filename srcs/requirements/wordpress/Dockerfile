FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Wordpress Docker image based on Debian 11"
# RUN apt-get -y update && apt-get -y install curl sendmail dumb-init
RUN apt-get -y update && apt-get -y install curl dumb-init

RUN apt-get install -y php7.3-fpm php7.3-mysql 

EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN chmod +x script.sh

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD [ "./script.sh" ]
