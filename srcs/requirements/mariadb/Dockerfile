# must only contain WordPress + php-fpm (installed and configured without nginx)
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install mariadb-server

EXPOSE 3306

RUN mkdir -p /script
COPY /tools/start-db.sh /script
RUN chmod +x /script/start-db.sh
 
# ENTRYPOINT ["/script/start-db.sh"]

# set comamnd prompt to indicate the container
RUN echo 'PS1="mariadb\e[0;36m \w\e[0m > "' >> ~/.bashrc

CMD ["tail", "-f", "/dev/null"]
# RUN /script/start-db.sh

# CMD ["mysqld"]
