#!/bin/bash

U=`stat -c "%U" /database`
G=`stat -c "%G" /database`

log () {
	printf "\e[36m\n > $@ \e[0m"
}

if [ "$U" == mysql ] && [ "$G" == mysql ]; then
	log "user/group already assigned to mysql\n"
else
	log "assigning /database to user/group mysql\n"
	chown -R mysql:mysql /database
fi

log "attempting to install the databse with the user mysql and in the database folder\n"
mariadb-install-db --user=mysql --basedir=/usr --datadir=/database

log "start mariadb service\n"
service mariadb start

#mariadb -u mysql



# not usesd
# mariadb-install-db \
# 	--user=mysql \
# 	--basedir=/database \
# 	--datadir=/database/data

# /etc/init.d/mariadb start
