# _Inseption_

A sys-admin project for setting up some containerized web services/hosting.

The LAMP stack is what we are asked to do:

- **L**inux for the os
- **E**nginx for the webserver
- **M**ariadb for the database
- **P**HP for dynamic processing

This readme is, a dump of some personal notes and links.

- [installing LEMP stack](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10)
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



## Quickstart

- launch the vm
- connect with ssh: `ssh znichola@localhost -p2222`
- pull the prject and cd into it
- run: `make`
- after install open browser to `znichola@42.fr` to see wp site
- `make <containter name>` to docker exec into the container to poke around
- `make data-clean` to compeltly while all files on disk
- `make fclean` to remove **all** containers and docker bits
- `sudo make data-clean && make re` to wipe everything and start again from scratch

## Commands

Add port forwarding to the vmbox

```
admir         8080 8080
ssh           2222 22
svelte-deploy 4200 4200
svelte-dev    5173 5173
wordpress     442  443 - this won't work when browsing becuase on mac we don't have access to hosts
```

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
```

ftp commands

```bash
make info
# ip adresses for the containers and env passwords
ftp -p <wordpress ip>
ftp> ls

# uploads the makefile from the local files
ftp> put Makefile

# the ! tells ftp to run a local command, in this case ls
ftp> !ls
```
