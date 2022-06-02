#!/bin/sh

if ! [ -f "/var/www/html/wordpress/index.php" ]; then
	sleep 15
	echo "start docker download"
	wp core download --allow-root
	echo "docker download ended"
	chown -R www-data:www-data /var/www/html/wordpress
	wp config create --dbname=${WP_DATABASE_NAME} --dbuser=${WP_DATABASE_USER} --dbpass=${WP_DATABASE_PASSWORD} --dbhost=${MYSQL_HOST} --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=${WP_HOST} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
    wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root
	chown -R www-data:www-data /var/www/html/wordpress
fi

exec "$@"
