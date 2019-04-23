FROM openjdk:jre-slim

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

ADD features /features
ADD karate.jar .

RUN java -jar karate.jar *

VOLUME /target