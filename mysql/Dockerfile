FROM alpine:latest

RUN apk update && apk upgrade\
	&& apk add mariadb mariadb-client\
	&& apk add mysql mysql-client\
	&& apk add openrc
RUN openrc boot
RUN mkdir -p /var/lib/mysql

COPY init_db.sh ./
COPY wordpress.sql ./
COPY wp_users.sql ./

EXPOSE 3306

ENTRYPOINT sh init_db.sh
