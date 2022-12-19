FROM debian

RUN apt-get -y update && apt-get -y install nginx

COPY /conf/default /etc/ngnix/sites-available/default

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

