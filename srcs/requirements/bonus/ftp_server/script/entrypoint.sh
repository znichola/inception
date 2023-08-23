#!/bin/bash

if [ "$1" == vsftpd ]; then
	printf "setting up vsftpd stuff ... \n"

	if [ "$WP_ADMIN" == "" ]; then
		WP_ADMIN=user_not_set
	fi



#	echo vsftpd_log_file="$(tty)" >> /etc/vsftpd.conf

	mkdir -p /var/run/vsftpd/empty /var/run/vsftpd /var/log/vsftpd
	mkdir -p /home/"$WP_ADMIN"

	touch /var/log/vsftpd/vsftpd.log
	touch /var/log/vsftpd/xferlog.log

	useradd -m -s /bin/bash $WP_ADMIN 2> /dev/null
	echo $WP_ADMIN > /etc/vsftpd.userlist
	echo "$WP_ADMIN:$WP_ADMIN_PWD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $WP_ADMIN:$WP_ADMIN /home/"$WP_ADMIN"

	# VSFTPd standard log container redirection
	tail -f /etc/vsftpd.log | tee /dev/stdout &
	tail -f /etc/xferlog.log | tee /dev/stdout &

	printf "setup done.\n"

	# we do this magic to keep the other process like tee /dev/stdout running
	# if we do a exec we repace this process and lose logging to terminal

	"$@" &
	pid="${!}"
	wait "${pid}"

else
	exec "$@"
fi
