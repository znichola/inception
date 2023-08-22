#!/bin/bash

# Define variables
MAX_RETRIES=5
DELAY_SECONDS=5
ATTEMPT=1

create_wp_config() {
	wp --allow-root config create \
	--dbname=wordpress --dbuser=$WP_DB_USER --dbpass=$WP_DB_USER_PWD --dbhost=mariadb --path=/website
}

finish_wp_setup() {
	wp --allow-root core install \
	--url=znichola.42.fr --title="The Endlessly Splinning Top" \
	--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email="$WP_ADMIN"@42.fr --skip-email --path=/website

	wp --allow-root user create \
	$WP_USER "$WP_USER"@42.fr --user_pass=$WP_USER_PWD \
	--role=author --description="Probably the best writer on staff." --path=/website
}

log () {
	printf "\e[36m\n > $@ \e[0m"
}

if [ "$(ls -A /website 2>/dev/null | wc -l)" -eq 0 ]; then
	log "website files are empty, will install wordpress files\n"
	cp -r /wordpress/* /website/

	cd /website

	# Loop to retry the command
	while [ $ATTEMPT -le $MAX_RETRIES ]; do
		echo "Attempt $ATTEMPT to connect to mariadb"
		create_wp_config
		if [ $? -eq 0 ]; then
			echo "Succeeded ... finishing up site and user setup"
			finish_wp_setup
			break
		fi
		echo "Failed. Retrying in $DELAY_SECONDS seconds..."
		sleep $DELAY_SECONDS
		ATTEMPT=$((ATTEMPT + 1))
	done

	if [ $ATTEMPT -gt $MAX_RETRIES ]; then
		echo "Maximum retries reached. Command failed."
	fi

	cd /

else
	log "wordpress folder is not empty, not copying it over\n"
fi

#/usr/sbin/php-fpm8.2 --nodaemonize
exec "$@"
