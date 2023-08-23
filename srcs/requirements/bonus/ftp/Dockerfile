FROM debian:bullseye

RUN apt-get -y update && apt-get -y install vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/ftp

EXPOSE 21/tcp

# CMD ["vsftpd"]

CMD ["tail", "-f", "/dev/null"]

# docker build . -t ftp
