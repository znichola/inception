# must only contain WordPress + php-fpm (installed and configured without nginx)
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install wordpress curl


# installing latest php version not in bulls eye package list
# https://stackoverflow.com/questions/66158318/couldnt-find-any-package-by-glob-php8-0-in-debian
RUN apt install -y wget gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt install -y php8.2-fpm php-mysql

# for some reason the php folder is not in the run dir so we just add it!
RUN mkdir -p /var/run/php

# but we actually want to be listening to a tcp socket, so also this
RUN sed -i 's#^listen = /run/php/php8.2-fpm.sock#listen = wordpress:9000#' /etc/php/8.2/fpm/pool.d/www.conf

# install the mariadb client for communication to the database
RUN apt install -y mariadb-client

# download and extract wordpress
RUN wget https://wordpress.org/wordpress-6.3.tar.gz
RUN tar -xf wordpress-6.3.tar.gz
RUN rm wordpress-6.3.tar.gz

# copy over script
RUN mkdir -p /script
COPY /tools/start.sh /script
RUN chmod +x /script/start.sh

EXPOSE 9000

# set comamnd prompt to indicate the container
RUN echo 'PS1="wordpress \w > "' >> ~/.bashrc

CMD ["/script/start.sh"]
#CMD ["tail", "-f", "/dev/null"]
