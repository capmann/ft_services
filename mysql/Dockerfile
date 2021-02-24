FROM alpine:latest

RUN apk update\
	&& apk add mariadb mariadb-client\
	&& apk add mysql mysql-client\
	&& apk add openrc
RUN openrc boot
RUN mkdir -p /var/lib/mysql
COPY init_db.sh ./

EXPOSE 3306

ENTRYPOINT sh init_db.sh
