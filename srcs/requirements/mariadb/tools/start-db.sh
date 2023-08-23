#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

DB=`du -s /database`
if [ "$DB" == "4	/database" ]; then
	log "databse is empty, attempting to install db and user\n"
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/database
	touch db_installed

	log "start mariadb service\n"
	service mariadb start

	log "adding user and creating database if needed\n"

	if [ "$WP_DB_USER" == "" ]; then
		log "no env variable\n"
		WP_DB_USER = "no_user_set"
	fi

	log "USER IS : "
	echo $WP_DB_USER

	sleep 5

	mariadb <<- EOF
	CREATE DATABASE IF NOT EXISTS wordpress;
	CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_USER_PWD}';
	GRANT ALL PRIVILEGES ON wordpress.* TO '${WP_DB_USER}'@'%';
	FLUSH PRIVILEGES;
	EOF

	log "stopping serive to put it into the forground"
	service mariadb stop
else
	if [ -f db_installed ]; then
		echo "db is installed"
	else
		mariadb-install-db --user=mysql --basedir=/usr --datadir=/database
	fi
	# service mariadb start
	# service mariadb stop
	log "database folder is not empty, skipping db install\n"
	# mkdir -p /run/mysqld
	# rm /var/lib/mysql/mysql.sock
	# chown -R mysql:root /database
	# service mariadb start
	# service mariadb stop
fi

#mariadbd
# mariadbd -u mysql
# /etc/init.d/mariadb start

# used to replace this script process with one passed as argument
exec "$@"
