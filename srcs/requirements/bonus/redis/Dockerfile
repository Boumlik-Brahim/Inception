FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Redis Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install redis-server dumb-init

EXPOSE 6379

COPY ./conf/redis.conf ./etc/redis/redis.conf

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["redis-server", "/etc/redis/redis.conf"]