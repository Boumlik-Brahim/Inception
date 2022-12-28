FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/bbrahim.key -out /etc/ssl/certs/bbrahim.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=Inception/OU=IT/CN=localhost/emailAddress=bbrahim@student.1337.ma"

RUN rm /etc/nginx/sites-available/default

COPY /conf/default /etc/nginx/sites-available/ 

EXPOSE 80/tcp

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
