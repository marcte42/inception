#!/bin/sh

if ! [ -d "/var/lib/mysql/wordpress" ]; then
	mysqld &
	sleep 5

	mysql -e "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';"
	mysql -e "DELETE FROM mysql.user WHERE User='';"
	mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
	mysql -e "DROP DATABASE IF EXISTS test;"
	mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
	mysql -e "CREATE DATABASE IF NOT EXISTS ${WP_DATABASE_NAME};"
	mysql -e "CREATE USER IF NOT EXISTS '${WP_DATABASE_USER}'@'%' IDENTIFIED BY '${WP_DATABASE_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${WP_DATABASE_NAME}.* TO '${WP_DATABASE_USER}'@'%';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin shutdown
fi

exec "$@"
