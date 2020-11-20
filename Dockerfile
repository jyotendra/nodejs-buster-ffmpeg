FROM jrottenberg/ffmpeg:4.1-ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN npm install pm2 -g

ENV DOCKER_VERSION=18.09.4
WORKDIR /usr/local/bin
RUN curl -sfL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" && \
  tar -xzf docker.tgz docker/docker --strip=1 && \
  rm docker.tgz

WORKDIR /workspace
ENTRYPOINT ["/bin/bash"]