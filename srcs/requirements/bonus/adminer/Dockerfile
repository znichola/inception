FROM debian:bullseye

RUN apt-get -y update && apt-get -y install adminer

# see wordpress for link
RUN apt install -y wget gnupg2 lsb-release
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt install -y php8.2-fpm php-mysql

EXPOSE 8080

# Start Adminer when the container runs
# CMD ["adminer"]
CMD ["tail", "-f", "/dev/null"]

# docker build -t adminer-debian .
# docker run --name adminer-container -d -p 8080:8080 adminer-debian
