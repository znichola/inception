#!/bin/bash

if [ "$1" == vsftpd ]; then
	printf "setting up vsftpd stuff ... \n"

	WP_ADMIN=db_user
	WP_ADMIN_PWD=123 

	touch /etc/vsftpd.log
	touch /etc/xferlog.log

#	echo vsftpd_log_file="$(tty)" >> /etc/vsftpd.conf

	mkdir -p /var/run/vsftpd/empty /var/run/vsftpd /var/log/vsftpd
	mkdir -p /home/"$WP_ADMIN"

	useradd -m -s /bin/bash $WP_ADMIN 2> /dev/null
	echo $WP_ADMIN > /etc/vsftpd.userlist
	echo "$WP_ADMIN:$WP_ADMIN_PWD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $WP_ADMIN:$WP_ADMIN /home/"$WP_ADMIN"

	# VSFTPd standard log container redirection
	tail -f /etc/vsftpd.log | tee /dev/stdout &
	tail -f /etc/xferlog.log | tee /dev/stdout &

	printf "setup done.\n"
fi	
exec "$@"

