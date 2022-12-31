#!/bin/bash

wp core download --path=/var/www/html --allow-root
rm -rf /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

wp config create --dbname=$DB_NAME \
                --dbuser=$DB_USER_NAME \
                --dbpass=$DB_USER_PASS \
                --dbhost=$HOST\
                --skip-check \
                --path=/var/www/html/ \
                --allow-root

wp core install --url=bbrahim.42.fr \
                --title="Inception" \
                --admin_name=bbrahim \
                --admin_password=admin@42 \
                --admin_email=bbrahim@student.1337.ma --path=/var/www/html/ --allow-root


wp user create boumlikbrahim \
                boumlikbrahim@student.1337.ma \
                --role=author \
                --user_pass=wpuser@123 \
                --allow-root \
                --path=/var/www/html/

# /usr/sbin/php-fpm7.3 --nodaemonize --allow-to-run-as-root
service php7.3-fpm start

service php7.3-fpm stop

php-fpm7.3 -F