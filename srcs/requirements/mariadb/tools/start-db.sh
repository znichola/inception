#!/bin/bash

chown -R mysql:mysql /database



# not usesd
# mariadb-install-db \
# 	--user=mysql \
# 	--basedir=/database \
# 	--datadir=/database/data

/etc/init.d/mariadb start

mariadb
