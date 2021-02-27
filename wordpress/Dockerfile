FROM alpine:latest

RUN apk update && apk upgrade\
		&& apk add nginx openssl\
		&& apk add wget

RUN  apk add php-fpm\ 
	&& apk add php7\
	&& apk add php-mysqli\
	&& apk add php7-opcache php7-gd php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz\
	&& tar -xzvf latest.tar.gz\
	&& mkdir -p /run/nginx\
	&& rm /var/lib/nginx/html/index.html

COPY default.conf /etc/nginx/conf.d
COPY wp-config.php /wordpress

RUN chmod 777 /wordpress

EXPOSE 5050

ENTRYPOINT php-fpm7 && nginx -g "daemon off;" && tail -f /dev/null
