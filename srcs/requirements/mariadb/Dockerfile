FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server

EXPOSE 3306

COPY conf/create_db.sql /

RUN service mysql start && mysql -uroot < create_db.sql

CMD [ "mysqld" ]