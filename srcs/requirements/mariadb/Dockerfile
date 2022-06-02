FROM debian:buster

EXPOSE 3306

RUN apt-get update \
    && apt-get install -y mariadb-server

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=mysql \
	&& mkdir /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld/ \
	&& chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld_safe"]

