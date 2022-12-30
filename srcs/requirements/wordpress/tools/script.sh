#!/bin/bash

wp core install --url=bbrahim.42.fr \
                --title="Inception" \
                --admin_name=bbrahim \
                --admin_password=admin@42 \
                --admin_email=bbrahim@student.1337.ma

wp config create --dbname=ma_base \
                --dbuser=bbrahim \
                --dbpass=user42 \
                --dbhost=localhost \
                --path=/var/www/html/ \
                --allow-root

wp user create bbrahim \
                bbrahim@student.1337.ma \
                --role=author \
                --user_pass=wpuser@123 \
                --allow-root \
                --path=/var/www/html/

/usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root