#!/bin/sh

if ! [ -f "/var/www/html/wordpress/index.php" ]; then
	wget https://wordpress.org/latest.tar.gz -P /tmp
	tar -xvf /tmp/latest.tar.gz -C /var/www/html
	chown -R www-data:www-data /var/www/html/wordpress
fi

exec "$@"
