FROM debian:buster
RUN apt-get update && apt-get install -y php php-common php-fpm php-mysql wget

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x tmp/entrypoint.sh

RUN mkdir -p /run/php
RUN mkdir /var/log/php-fpm

COPY ./conf/www.conf etc/php/7.3/fpm/pool.d/www.conf 

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["php-fpm7.3", "-F", "-R"]
