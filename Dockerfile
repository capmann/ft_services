FROM alpine:latest

RUN apk update\
		&& apk add nginx\
		&& apk add wget
RUN  apk add php-fpm\ 
	&& apk add php7\
	&& apk add php-mysqli
RUN wget https://wordpress.org/latest.tar.gz\
	&& tar -xzvf latest.tar.gz\
	&& mkdir -p /run/nginx 

ADD default.conf /etc/nginx/conf.d/default.conf
ADD wp-config.php /wordpress/wp-config.php

RUN chmod 777 /wordpress

EXPOSE 80
EXPOSE 443

ENTRYPOINT php-fpm7 && nginx -g 'daemon off;'
