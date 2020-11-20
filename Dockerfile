FROM node:12.16.1-buster

RUN apt update
RUN apt install -y build-essential curl
RUN apt install -y libva-dev vainfo

WORKDIR /ffmpeg
RUN ["/bin/bash", "-c", "yes Y | bash <(curl -s 'https://raw.githubusercontent.com/markus-perl/ffmpeg-build-script/master/web-install.sh?v1')"]
ENV PATH="/ffmpeg/workspace/bin:${PATH}"

# Add docker CLI
# Added docker CLI version 18.09.4
ENV DOCKER_VERSION=18.09.4
WORKDIR /usr/local/bin
RUN curl -sfL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" && \
  tar -xzf docker.tgz docker/docker --strip=1 && \
  rm docker.tgz

RUN npm install pm2 -g

WORKDIR /workspace