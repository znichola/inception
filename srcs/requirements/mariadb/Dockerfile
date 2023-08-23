# must only contain mariaDB
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install mariadb-server vim

EXPOSE 3306

RUN mkdir -p /script
COPY /tools/start-db.sh /script
RUN chmod +x /script/start-db.sh


# set comamnd prompt to indicate the container
RUN echo 'PS1="mariadb \w > "' >> ~/.bashrc

# set the bind adress to 0s so we listen to the whole netword
# and not just localhost as i've been doing like an idiot
RUN echo ""
RUN echo "#inception" >> /etc/mysql/my.cnf
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
#RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
RUN echo "skip-networking=0" >> /etc/mysql/my.cnf
RUN echo "skip-bind-address" >> /etc/mysql/my.cnf
RUN echo "datadir=/database" >> /etc/mysql/my.cnf

RUN mkdir -p /database
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/database

# this seems like it should be broken the file get overwritten
RUN mkdir database ; chown mysql:mysql /database
RUN mkdir -p /run/mysqld

RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/database

ENTRYPOINT ["/script/start-db.sh"]
CMD ["mariadbd", "-u", "mysql"]


#CMD ["tail", "-f", "/dev/null"]

#CMD ["mariadbd"]
