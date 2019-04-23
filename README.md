# Karate APIDaysMad19

Repo with assets that will be used in a talk about [Karate testing framework](https://github.com/intuit/karate) that will be held in [API Days Madrid 2019 Conference](http://apidaysmad.apiaddicts.org/)

You can find the slides [here](https://bit.ly/apidays-karate-slides).

## Prerequisites
 - [Java 8+ runtime](https://java.com/en/download/manual.jsp) or [Docker](https://docs.docker.com/install/)

### Run the test suite
Once inside the cloned repo, you can run the test suite with your local Java with:
```
java -jar karate.jar *
```
...or you can use your docker engine (useful if you don't have Java runtime installed):
```
docker run -v "$PWD/target:/target" arcones/karate-dsl:latest
```

### Reports
Either with Java or Docker, the execution should generate a Cucumber HTML report that could be open at `./target/cucumber-html-reports`

## Want some more? 
A repo with a more complete Karate test suite could be found [here](https://github.com/arcones/karate-meetup)

I went through all those examples in the following [meetup](http://bit.ly/karate-meetup)

## Any feedback?
Send me anything but viruses to marta.arcones@gmail.com
