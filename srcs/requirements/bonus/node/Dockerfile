FROM debian:bullseye

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NODE_VERSION 20.5.1

RUN apt-get update && apt-get curl \
	&& curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
	&& apt-get install -y nodejs

CMD ["tail", "-f", "/dev/null"]

