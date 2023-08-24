FROM debian:bullseye

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NODE_VERSION 20.5.1

# https://github.com/nodesource/distributions
RUN apt-get update && apt-get -y install curl \
	&& curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
	&& apt-get install -y nodejs

# set comamnd prompt to indicate the container
RUN apt install -y zsh vim git
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir -p /script
COPY /script/entrypoint.sh /script
RUN chmod +x /script/entrypoint.sh

EXPOSE 5173

ENTRYPOINT ["/script/entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
#CMD ["npm", "run", "dev", "--", "--host"]

# docker build -t node-server .
# docker run --init --name node-server -p 420:420 node-server 
# docker exec -it node-server  zsh
