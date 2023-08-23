# _Inseption_

A sys-admin project about setting up some basic containerised webhosting.

This readme is, for now just a dump of some personal notes and links that are usefull for understanding this project.

- [docker command](https://codenotary.com/blog/extremely-useful-docker-commands)
- [setting up SSL on docker](https://gist.github.com/dahlsailrunner/679e6dec5fd769f30bce90447ae80081)
- [another ssl link](https://nginx.tutorials24x7.com/blog/how-to-enable-tls-1-2-and-tls-1-3-in-nginx)
- [really good ssl link, i think](https://www.feistyduck.com/library/openssl-cookbook/online/openssl-command-line/determine-version-and-configuration.html)
- [extension of above link with the correct section](https://www.feistyduck.com/library/openssl-cookbook/online/openssl-command-line/key-generation.html)
- [-sub explication](https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm#Usingthe-subjSwitch)
- [marai-db](https://mariadb.com/kb/en/a-mariadb-primer/)
- [wordpress to php-fmp](https://blog.devsense.com/2019/php-nginx-docker)
- [unix socket vs tcp socker](https://serversforhackers.com/c/php-fpm-configuration-the-listen-directive)
- [pid 1 and best practive containers](https://cloud.google.com/architecture/best-practices-for-building-containers)

## bonus

- [vsftp](https://gitlab.com/docker-files1/vsftpd)
- [vsftp man](https://linux.die.net/man/5/vsftpd.conf)


This is long a confusing, maybe this link is better and simpler

The LAMP stack is what we are asked to do:

**L**inux for the os
**E**nginx for the webserver
**M**ariadb for the database
**P**HP for dynamic processing

- [installing LEMP stack](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)
- [installing wordpress with LEMP](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10)


## Commands

To show the mariadb database is setup correctly
```mysql
-- to see the different database there are
SHOW DATABASES;

-- select a db to use
USE wordpress;

-- to show the varous tables there are in the db
SHOW TABES;

-- to see the various colum names in the table
DESCRIBE wp_comments;

-- to select data to be displayed
SELECT comment_author, comment_content FROM wp_comments;

-- or to see everything in a table;
SELECT * FROM wp_users;


SELECT User FROM mysql.user;
```
