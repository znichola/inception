FROM debian:bullseye

RUN apt-get -y update && apt-get -y install nginx wordpress curl apache2 mariadb-server

# copy over the default site config from our local file
COPY wp.conf /etc/apache2/sites-available/wp.conf

# RUN mysql_secure_installation

EXPOSE 4242/tcp

# -g         is spesify a directive to nginx
# daemon off is to disable start as a daemon, so the process is in the 
#            forgroud, considered best practive for docker 
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
ENTRYPOINT /bin/bash

