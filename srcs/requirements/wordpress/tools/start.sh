#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

FOLDER=`du -s /website`
if [ "$FOLDER" == "4	/database" ]; then
	log "website files are empty, will install wordpress files\n"
	mv /wordpress/* /website/
else
	log "wordpress folder is not empty, not copying it over\n"
fi

/usr/sbin/php-fpm8.2 --nodaemonize

