FROM ubuntu
MAINTAINER arjun
RUN apt-get update -y
CMD ['echo','hello-world']


# Docker Compose

version: "3.9"
services:
  web:
    build: .
    ports:
      - "5000:5000"
  redis:
    image: "redis:alpine"

# Docker file for Python pip and flask

FROM  ubuntu:20.04
RUN apt-get update -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip


## Docker multi stage

FROM maven as maven
RUN mkdir /usr/src/mymaven
WORKDIR /usr/src/mymaven
COPY . .
RUN mvn install -DskipTests

FROM tomcat 
WORKDIR webapps 
COPY --from=maven /usr/src/mymaven/target/java-tomcat-maven-example.war .
RUN rm -rf ROOT && mv java-tomcat-maven-example.war ROOT.war
























