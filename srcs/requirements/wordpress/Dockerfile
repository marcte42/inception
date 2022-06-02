FROM debian:buster

EXPOSE 9000 

RUN apt-get update && apt-get install -y php php-common php-fpm php-mysql php-gd php-curl php-dom php-imagick php-mbstring php-zip php-intl wget mariadb-client

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x tmp/entrypoint.sh

RUN mkdir -p /run/php
RUN mkdir /var/log/php-fpm

COPY ./conf/www.conf etc/php/7.3/fpm/pool.d/www.conf 

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm7.3", "-F", "-R"]
