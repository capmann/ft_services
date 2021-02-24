#!/bin/bash

/etc/init.d/mariadb setup
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d.mariadb-server.cnf
service mariadb start

if [ ! -d /var/lib/mysql/wordpress ]
then
	(
	mysql --execute "CREATE DATABASE wordpress"
	mysql --execute "GRANT ALL PRIVILEGES ON wordpress.* TO 'cmarteau'@'%' IDENTIFIED BY 'yo';"
	mysql --execute "GRANT INSERT ON wordpress.* TO 'ft_caputchar'@'%' IDENTIFIED BY 'yo';"
	mysql --execute "FLUSH PRIVILEGES;"
	mysql -u root wordpress < wordpress.sql
	)
fi
tail -f /dev/null
