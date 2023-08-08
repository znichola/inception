# must only contain WordPress + php-fpm (installed and configured without nginx)
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install wordpress

# installing latest php version not in bulls eye package list
# https://stackoverflow.com/questions/66158318/couldnt-find-any-package-by-glob-php8-0-in-debian
RUN apt install -y wget gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt install -y php8.2-fpm php-mysql


EXPOSE 9000

# set comamnd prompt to indicate the container
RUN echo 'PS1="wordpress \w > "' >> ~/.bashrc

CMD ["tail", "-f", "/dev/null"]
