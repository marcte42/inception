FROM alpine:3.14
RUN apk add php7 \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-mysqli \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-session \
    php7-soap \
    php7-xml \
    php7-zip

RUN adduser -D -g 'www' www \
    && mkdir /www \
    && chown -R www:www /www

COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf
ENTRYPOINT  ["php-fpm7", "-F", "-R"]
