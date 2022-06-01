FROM debian:buster
RUN apt-get update && apt-get install -y nginx openssl
RUN chown -R www-data:www-data /var/lib/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
	&& openssl req -x509 -nodes -days 1 -newkey rsa:2048 		\
		-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=mterkhoy.42.fr" \
		-keyout etc/ssl/private/mterkhoy.key					\
		-out etc/ssl/certs/mterkhoy.crt

COPY	./conf/default.conf /etc/nginx/http.d/default.conf
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT  ["nginx", "-g", "daemon off;"]
