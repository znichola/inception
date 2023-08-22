#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

if [ "$(ls -A /website 2>/dev/null | wc -l)" -eq 0 ]; then
	log "website files are empty, will install wordpress files\n"
	cp -r /wordpress/* /website/

	wp --allow-root config create \
	--dbname=wordpress --dbuser=$WP_DB_USER --dbpass=$WP_DB_USER_PWD --dbhost=mariadb --path=/wordpress

	wp --allow-root core install \
	--url=znichola.42.fr --title="The Endlessly Splinning Top" \
	--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email="$WP_ADMIN"@42.fr --skip-email --path=/wordpress

	wp --allow-root user create \
	$WP_USER "$WP_USER"@42.fr --user_pass=$WP_USER_PWD \
	--role=author --description="Probably the best writer on staff." --path=/wordpress

else
	log "wordpress folder is not empty, not copying it over\n"
fi

/usr/sbin/php-fpm8.2 --nodaemonize
