FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Ngnix Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install nginx dumb-init; \
    apt-get install -y openssl; \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/bbrahim.key \
    -out /etc/ssl/certs/bbrahim.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=Inception/OU=IT/CN=localhost/emailAddress=bbrahim@student.1337.ma";

COPY ./conf/default ./etc/nginx/sites-available/ 

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "/usr/sbin/nginx"]

CMD ["-g", "daemon off;"]
