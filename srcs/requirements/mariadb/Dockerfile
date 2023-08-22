# must only contain mariaDB
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install mariadb-server vim

EXPOSE 3306

RUN mkdir -p /script
COPY /tools/start-db.sh /script
RUN chmod +x /script/start-db.sh


# set comamnd prompt to indicate the container
RUN echo 'PS1="mariadb \w > "' >> ~/.bashrc

# relic from when I though it was a good idea to generate
# the db files only on image build
ARG WP_USER
ARG WP_USER_PWD

# set the bind adress to 0s so we listen to the whole netword
# and not just localhost as i've been doing like an idiot
RUN echo "#inception" >> /etc/mysql/my.cnf
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
#RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
RUN echo "skip-networking=0" >> /etc/mysql/my.cnf
RUN echo "skip-bind-address" >> /etc/mysql/my.cnf

# RUN /script/start-db.sh

ENTRYPOINT ["/script/start-db.sh"]


#CMD ["tail", "-f", "/dev/null"]

#CMD ["mariadbd", "-u", "mysql"]
#CMD ["mariadbd"]
