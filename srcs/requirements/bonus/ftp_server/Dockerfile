FROM debian:bullseye

RUN apt-get -y update && apt-get -y install vsftpd

RUN mkdir -p /script

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY script/entrypoint.sh /script/entrypoint.sh
RUN chmod +x /script/entrypoint.sh

# set comamnd prompt to indicate the container
RUN echo 'PS1="vsftpd \w > "' >> ~/.bashrc

EXPOSE 21/tcp

ENTRYPOINT ["script/entrypoint.sh"]
CMD ["vsftpd"]

# docker build -t ftp-server .
# docker run --name ftp-server -p 21:21 ftp-server
# docker exec -it ftp-server bash
