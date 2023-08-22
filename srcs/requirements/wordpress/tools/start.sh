#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

if [ "$(ls -A /website 2>/dev/null | wc -l)" -eq 0 ]; then
	log "website files are empty, will install wordpress files\n"
	mv /wordpress/* /website/
	mv /wordpress/wp-config-sample.php /wordpress/wp-config.php
	sed -i 's/database_name_here/wordpress/g' /wordpress/wp-config.php
	sed -i 's/database_name_here/wordpress/g' /wordpress/wp-config.php

else
	log "wordpress folder is not empty, not copying it over\n"
fi

/usr/sbin/php-fpm8.2 --nodaemonize

