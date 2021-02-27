FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add influxdb

COPY init_db.sh /
ADD influxdb.conf /etc/influxdb.conf

EXPOSE 8086

RUN chmod 777 init_db.sh

ENTRYPOINT ./init_db.sh
