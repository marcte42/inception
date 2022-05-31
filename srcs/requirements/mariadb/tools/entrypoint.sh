#!/bin/sh

if ! [ -d "/var/lib/mysql/wordpress" ]; then
	mysqld &
	sleep 15
	mysql -sfu root < "/tmp/db_setup.sql"
	mysqladmin shutdown
fi

exec "$@"
