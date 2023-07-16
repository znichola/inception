# must only contain NGINX and TLSv1.3
FROM debian:bullseye

RUN apt-get -y update && apt-get -y install nginx

# copy over the default site config from our local file
COPY conf /etc/nginx/sites-available/default

EXPOSE 9000/tcp

# -g         is spesify a directive to nginx
# daemon off is to disable start as a daemon, so the process is in the 
#            forgroud, considered best practive for docker 
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

# not sure this is needed?
# CMD ["bash"]

# docker build . -t inception/server
# -t         is to spesify a tag by which we can refer to the container

# docker run -d -p 9000:9000 inception/server
# -d         is to run it in detatched mode
# -p         is the port spec, it's local-port:container-port

# https://www.baeldung.com/linux/nginx-docker-container#search
# great link to all the information needed to get this going
