# must only contain WordPress + php-fpm (installed and configured without nginx)
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install mariadb-server vim

EXPOSE 3306

RUN mkdir -p /script
COPY /tools/start-db.sh /script
RUN chmod +x /script/start-db.sh


# set comamnd prompt to indicate the container
RUN echo 'PS1="mariadb \w > "' >> ~/.bashrc

ARG WP_USER
ARG WP_USER_PWD

# RUN /script/start-db.sh

#ENTRYPOINT ["/script/start-db.sh"]


#CMD ["tail", "-f", "/dev/null"]

CMD ["mariadbd", "-u", "mysql"]
#CMD ["mariadbd"]
