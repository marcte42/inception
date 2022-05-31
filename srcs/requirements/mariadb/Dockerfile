FROM debian:buster

EXPOSE 3306

RUN apt-get update \
    && apt-get install -y mariadb-server

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/db_setup.sql /tmp/db_setup.sql

RUN mysql_install_db --user=mysql \
	&& mkdir /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld/ \
	&& chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld_safe"]


# RUN apt-get install mariadb mariadb-client

# RUN mysql_install_db \
#     && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld


# COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf



# # COPY ./tools/startup.sh /startup.sh



# # RUN chmod 777 /startup.sh
# #
# # ENTRYPOINT ["/startup.sh"]

# ENTRYPOINT ["tail", "-f"];
