# Karate APIDaysMad19

Repo with assets that will be used in a talk about [Karate testing framework](https://github.com/intuit/karate) that will be held in [API Days Madrid 2019 Conference](http://apidaysmad.apiaddicts.org/)

You can find the slides [here](https://bit.ly/apidays-karate-slides).

## Prerequisites
 - [Java 8+ runtime](https://java.com/en/download/manual.jsp) or [Docker](https://docs.docker.com/install/)


## With Java
    ```
    java -jar karate.jar *
    ```
## With Docker
    ```
    docker run -v "$PWD/target:/target" arcones/karate-dsl:latest
    ```

## Reports
Either with Java or Docker, the execution should have generated a Cucumber HTML report that could be open at [./target/cucumber-html-reports/overview-features.html](./target/cucumber-html-reports/overview-features.html)

## Want some more? 
A repo with a more complete Karate test suite could be found [here](https://github.com/arcones/karate-meetup)

## Any feedback?
Send me anything but viruses to marta.arcones@gmail.com



DOCKER

docker build . -t karate-dsl

docker run -d -p 8000:99 arcones/karate-dsl:latest
