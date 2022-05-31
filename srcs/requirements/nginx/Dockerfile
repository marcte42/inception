FROM alpine:3.14
RUN apk add --no-cache nginx openssl
RUN adduser -D -g 'www' www \
    && mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
	&& openssl req -x509 -nodes -days 1 -newkey rsa:2048 		\
		-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=mterkhoy.42.fr" \
		-keyout etc/ssl/private/mterkhoy.key					\
		-out etc/ssl/certs/mterkhoy.crt

COPY	./conf/default.conf /etc/nginx/http.d/default.conf
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT  ["nginx", "-g", "daemon off;"]
