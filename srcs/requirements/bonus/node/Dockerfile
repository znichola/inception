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
RUN echo 'PS1="node \w > "' >> ~/.bashrc
#RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
#    -t eastwood
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


CMD ["tail", "-f", "/dev/null"]

# docker build -t node-server .
# docker run --init --name node-server -p 420:420 node-server 
# docker exec -it node-server  zsh
