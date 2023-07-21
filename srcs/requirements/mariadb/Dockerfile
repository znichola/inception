# must only contain WordPress + php-fpm (installed and configured without nginx)
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install mariadb-server

EXPOSE 3306

RUN mkdir -p /script
COPY /tools/start-db.sh /script
RUN chmod +x /script/start-db.sh
 
# ENTRYPOINT ["/script/start-db.sh"]

RUN /script/start-db.sh

CMD ["mysqld"]
