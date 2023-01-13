FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="vsftpd Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install vsftpd dumb-init

EXPOSE 20 21 40000-40005

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["/tmp/script.sh"]