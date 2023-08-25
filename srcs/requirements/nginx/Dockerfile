# must only contain NGINX and TLSv1.3
FROM debian:bullseye

RUN apt -y update && apt -y install nginx openssl

# copy over the default site config from our local file
COPY conf/default /etc/nginx/sites-available/default

EXPOSE 443/tcp
EXPOSE 4200

# make the ssl certs and put them in the right place
RUN openssl \
    req \
    -nodes \
    -x509 \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=CH/ST=VAUD/L=Renens/O=Znichola Inc/OU=DevOps/CN=znichola.42.fr/emailAddress=znichola@student.42lausanne.ch"

# ENTRYPOINT /bin/bash

# set comamnd prompt to indicate the container
RUN echo 'PS1="nginx \w > "' >> ~/.bashrc

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
# -g         is spesify a directive to nginx
# daemon off is to disable start as a daemon, so the process is in the 
#            forgroud, considered best practive for docker 

# docker build . -t inception/server
# -t         is to spesify a tag by which we can refer to the container

# docker run -d -p 443:443 inception/server
# -d         is to run it in detatched mode
# -p         is the port spec, it's local-port:container-port

# https://www.baeldung.com/linux/nginx-docker-container#search
# great link to all the information needed to get this going
