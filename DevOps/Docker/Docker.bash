- docker hub == repo
- namespaces and CGROUPS – it will use these 2 concepts to differentiate the containers and isolate them

- install docker 
:: curl https://get.docker.com/ | bash == in userscripts in aws

docker image
docker container == running image

docker search <name>

docker ps -a
docker ps
docker stop <id> <id>
docker run -p

docker rmi

docker rm 

docker logs --help

docker system prune

docker exec -it <cont.id> sh

docker container ls

docker network ls

CTRL+P and CTRL+Q == without stopping u will grt out..

docker network create --driver bridge arjun-net

-- in the same network containers can be pinged...

docker network connect bridge cont1

docker network disconnect my-network alpine-one 

##docker network:

 docker network create -d overlay \
  --subnet=192.168.10.0/25 \
  --ip-range=172.28.5.0/24 \
  --gateway=192.168.20.100 \
  my-multihost-network

>>>> key points are there in document.......

- bridge
- host
- null

## docker container storage

- default=> ephimeral == it is not persistent

> bind mount
> connect to external storage (persistent)


copy on write (COW) *****

bind mount:

docker exec dazzling_payne ls /app

docker run -itd --mount type=bind,source="$(pwd)"/bindmount,target=/app alpine

docker run -itd -v source="$(pwd)"/bindmount,target=/app alpine

>> we can use --mount and -v argument..

## persistent storage - volume

docker volume create myvol
docker volume ls

>> docker run -d --name devtest --mount source=myvol2,target=/app nginx:latest

>> docker run -d --name devtest -v myvol2:/app nginx:latest
 
 --mount is more explicit and verbose. The biggest difference is that the -v syntax combines all the options together in one field, while the --mount syntax separates them.


# Docker compose

we can run multiple containers in single file

when we dont specify any n/w b/w them it create network and place those containers in it.

apt  install docker-compose

docker-compose -f dockercompose.yml up

compose file:
   depends_on:
    - mongo

#docker file:

Dockerfile - default but its not mandatory

run - gets executed when on build
cmd - when we create container out of it then it executes, ENTRY POINT

docker build /<loc>

docker build -t myimage:v1.0 .


## RUN CMD ENTRYPOINT - difference in docs

RUN - runs when building image

## not mandatory case sensitive for docker commands but it is recommended to give it in upper case


docker attach == we can see o/p in 2 terminals interactively

# docker layer

# docker build

- whatever there are files in the dir(docker context) will be sent to docker deamon when building image

docker build --compress .

docker build -t arjunimage:1.0 .

docker build -f ../dockfile .

docker build --no-cache .

docker build --pull .

#commit

create image out of running container

docker commit <contid> <name>


#cp

docker cp . a967e1eae986:/tmp

# create

docker create -it alpine /bin/sh == status is created

# diff

docker diff <contid> == gives the changes in the file system

## events

docker events == real time logs when container is stopped and started etc..


docker export <contid> > name.tar --> exports file system to tar file

docker import name.tar  --> creates new image out of it


docker history <imageid>

•	docker history myimage:1.0

docker run 021b3423115f uname

docker images --help

docker images -a -- dangling images

docker images -q -- only id

docker images -aq --filter "dangling=true"
 - dangling images are intermediate images
 
docker info -> gives system info

docker inspect arjunimage:1.0


docker kill vigilant_gates  -- it sends signal 9


docker stop <contid> -- sends signal 15 it waits for some time(halts) and then kills


docker save <imagename> > image.tar  -----> saves the image into tar

docker save -o fedora-latest.tar fedora:latest

docker load -i image.tar -----> the tar can be loaded into

docker rm $(docker ps -aq)

docker login

docker logout --> removes all login

docker login -u <uname> -p <pwd>

docker logs <contid>

docker pause <contid>

docker unpause <contid>

docker port <contid>

docker push <imagename>

docker rename nice_golick httpdser


docker restart


docker kill --signal=SIGHUP <contid> ----> restarts the process inside

docker kill and docker stop ---> docker kill drctly sends 9signal docker stop 15 and waits for the process and then 9

docker search busybox

docker search -f stars=3 busybox

docker stats --> live containers performance and resources

docker tag c80be87d097e arjunkiimage

docker top <4d5d3660cf6f>

docker version

docker wait <contid> -----> container waits

docker rename <cname> <cont.newname>

## Docker File

docker build -f <filename> .

docker build -t jenkins/centos:v1 .

##

FROM 
MAINTAINER
RUN
COPY
ADD  -- A valid use case for ADD is when you want to extract a local tar file into a specific directory in your Docker                   image
ENV
ENTRYPOINT
EXPOSE
USER
VOLUME
LABEL
WORKDIR
ONBUILD


COPY ./app.py /app.py   --> copy from current location to docker container location

WORKDIR

> docker run -it -d --name workdirusage -p 6000:5000 <imageid>

> docker exec -it <contid> bash

## multi stage docker file

- to froms
- we will copy into next from and will load the prev image into cache


## Docker compose

- multiple containers in a single file

CMD -- command line instructions

ENTRYPOINT -- mainly executable files


public repo --> u can make one image as private

colloborators --> giving access to users

docker 

