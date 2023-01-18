FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Wordpress Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install curl dumb-init; \
    apt-get install -y php7.3-fpm php7.3-mysql; \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /usr/local/bin/wp;

EXPOSE 9000

COPY ./tools/script.sh ./

COPY ./conf/www.conf ./etc/php/7.3/fpm/pool.d/

RUN chmod +x script.sh

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["./script.sh"]