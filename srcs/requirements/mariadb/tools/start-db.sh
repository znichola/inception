#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

DB=`du -s /database`
if [ "$DB" == "4	/database" ]; then
	log "attempting to install the databse with the user mysql and in the database folder\n"
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/database
else
	log "database folder is not empty, skipping db install\n"
fi

log "start mariadb service\n"
service mariadb start

> mariadb <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'znichola'@'wordpress.inception-net' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'znichola'@'wordpress.inception-net';
FLUSH PRIVILEGES;
EOF

service maraidb stop

mariadbd -u mysql

#mariadb -u mysql

# /etc/init.d/mariadb start

