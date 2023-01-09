FROM debian:buster

RUN apt-get -y update 
RUN  apt-get -y install vsftpd

EXPOSE 21

# COPY ./conf/vsftpd.conf /etc/

# COPY ./tools/script.sh /tmp/

# RUN chmod +x /tmp/script.sh

# CMD ["/tmp/script.sh"]
CMD ["tail", "-f"]