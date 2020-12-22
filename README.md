This repository builds a Node.js (buster) image for V12.10.
It also include the docker-client for communicating with docker socket, via dockerode, if ever needed.. 

## Push image
docker build . -t jyotech/jsnode:0.1
docker push jyotech/jsnode:0.1