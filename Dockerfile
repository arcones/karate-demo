FROM openjdk:jre-slim

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

ADD features features
ADD karate.jar .

VOLUME target

CMD [ "java", "-jar", "karate.jar", "features/" ]
