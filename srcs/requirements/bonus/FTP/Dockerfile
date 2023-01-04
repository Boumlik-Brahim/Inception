FROM debian:buster

RUN apt-get -y update && apt-get -y install vsftpd

EXPOSE 21

COPY /conf/vsftpd.conf /tmp/vsftpd.conf

COPY /tools/configure.sh /tmp/configure.sh

CMD [ "vsftpd", "/etc/vsftpd.conf" ]