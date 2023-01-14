FROM debian:buster

LABEL maintainer="BOUMLIK BRAHIM <boumlik01brahim@gmail.com>" Description="Mariadb Docker image based on Debian 11"

RUN apt-get -y update && apt-get -y install mariadb-server dumb-init

EXPOSE 3306

COPY ./conf/create_db.sql ./

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql -uroot < create_db.sql

ENTRYPOINT ["/usr/bin/dumb-init"]

CMD ["mysqld"]