#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

if [ "$(ls -A /website 2>/dev/null | wc -l)" -eq 0 ]; then
	log "website files are empty, will install wordpress files\n"
	mv /wordpress/* /website/
#	mv /website/wp-config-sample.php /website/wp-config.php
#	sed -i "s/database_name_here/wordpress/g" /website/wp-config.php
#	sed -i "s/username_here/$WP_USER/g" /website/wp-config.php
#	sed -i "s/password_here/$WP_USER_PWD/g" /website/wp-config.php
#	sed -i "s/localhost/mariadb/g" /website/wp-config.php
#	SPICE="$(curl https://api.wordpress.org/secret-key/1.1/salt/)"
#	sed -i "/\/\*\*#@+/,/\/\*\*#@-*/c\\$SPICE" /website/wp-config.php
#	#sed '/\/\*\*#@+/,/\/\*\*#@-*/c\'"$SPICE" /website/wp-config.php
else
	log "wordpress folder is not empty, not copying it over\n"
fi

/usr/sbin/php-fpm8.2 --nodaemonize
