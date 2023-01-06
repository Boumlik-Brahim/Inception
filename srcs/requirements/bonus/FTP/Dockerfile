FROM debian:buster

RUN apt-get -y update && apt-get -y install vsftpd

EXPOSE 21

COPY /tools/script.sh /tmp/

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]