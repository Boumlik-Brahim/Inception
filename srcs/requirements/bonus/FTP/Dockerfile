FROM debian:buster

RUN apt-get -y update && apt-get -y install vsftpd

EXPOSE 20 21 40000-40005

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]