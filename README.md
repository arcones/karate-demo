# Karate :martial_arts_uniform: APIDaysMad19 :rocket:

Repo with assets that will be used in a talk about [Karate testing framework](https://github.com/intuit/karate) that will be held in [API Days Madrid 2019 Conference](http://apidaysmad.apiaddicts.org/)

You can find the slides [here](https://bit.ly/apidays-karate-slides).

## Prerequisites :coffee: || :whale2:
 - [Java 8+ runtime](https://java.com/en/download/manual.jsp) **or** [Docker](https://docs.docker.com/install/)

### Run the test suite :gear:
Once inside the cloned repo, you can run the test suite with your *local Java runtime* with:
```
java -jar karate.jar *
```
...or you can use your *docker engine* (useful if you don't have Java runtime installed):
```
docker run -v "$PWD/target:/target" arcones/karate-dsl:latest
```

### Reports :bar_chart:
The execution should generate a Cucumber HTML report that could be open with your favourite browser at `target/cucumber-html-reports/overview-features.html`

## Want some more? :up:
A repo with a more complete Karate test suite could be found [here](https://github.com/arcones/karate-meetup)

I went through all those examples in the following [meetup](http://bit.ly/karate-meetup)

## Any feedback? :innocent:
Send me anything but viruses to marta.arcones@gmail.com :woman_technologist:
