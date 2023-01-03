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
                --extra-php
                <<PHP
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'redis');
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
PHP

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

service php7.3-fpm start

wp plugin install redis-cache --path=/var/www/html --activate --allow-root 
wp redis enable --path=/var/www/html/ --allow-root

service php7.3-fpm stop

php-fpm7.3 -F