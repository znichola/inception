# base for this file
# https://github.com/dockette/adminer/blob/master/adminer-mysql/Dockerfile

FROM alpine:3.17

ENV WORKERS=4
ENV PHP_CLI_SERVER_WORKERS=${WORKERS}

# old packages that don't yet exist in the second to latest version found here
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.14/community' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/v3.17/community' >> /etc/apk/repositories && \
	apk update && \
	apk upgrade && \
	apk add \
		wget \
		ca-certificates \
		php8@community \
		php8-session@community \
		php8-mysqli@community && \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /srv/index.php && \
	ln -s /usr/bin/php8 /usr/bin/php && \
	apk del wget ca-certificates && \
	rm -rf /var/cache/apk/*

# set comamnd prompt to indicate the container
RUN echo 'PS1="adminer \w > "' >> ~/.bashrc

WORKDIR /srv
EXPOSE 8080


CMD ["php", "-d", "memory_limit=256M", "-S", "0.0.0.0:8080"]
