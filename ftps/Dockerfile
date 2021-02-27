FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add vsftpd openssl
RUN addgroup -g 1000 -S cmarteau
RUN adduser -u 1000 -D -G cmarteau -h /home/cmarteau -s /bin/false cmarteau
RUN chown cmarteau:cmarteau /home/cmarteau/ -R
RUN echo "cmarteau:yo" | /usr/sbin/chpasswd

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key -out /etc/ssl/certs/vsftpd-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=cmarteau/OU=./CN=192.168.49.240"

ADD  vsftpd2.conf /etc/vsftpd/vsftpd.conf
ADD vsftpd.chroot_list /etc/vsftpd.chroot_list

EXPOSE 21 20 30100 30101 

CMD vsftpd /etc/vsftpd/vsftpd.conf 
