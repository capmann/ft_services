FROM alpine:latest

RUN apk update\
		&& apk add nginx openssl\
		&& apk add php-fpm\
		&& apk add php-mysqli\
		&& mkdir -p /run/nginx

ADD default.conf /etc/nginx/conf.d

RUN apk add php7 php7-fpm php7-mysqli

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz\
		&& tar -xvzf phpMyAdmin-5.0.4-english.tar.gz\
		&& mkdir /var/lib/nginx/html/phpmyadmin\
		&& mv /phpMyAdmin-5.0.4-english/* /var/lib/nginx/html/phpmyadmin

ADD config.inc.php /var/lib/nginx/html/phpmyadmin
RUN chmod 777 /var/lib/nginx/html/phpmyadmin
#COPY www.conf /etc/php7/php-fpm.d/

EXPOSE 5000

ENTRYPOINT php-fpm7 -R && nginx -g 'daemon off;' && tail -f /dev/null

