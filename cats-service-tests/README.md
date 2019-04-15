# Cats service tests

Karate test suite for [Cats-as-a-service](https://github.com/arcones/cats-as-a-service) HTTP API.

## Prerequisites
- [Java 8+](https://www.java.com) should be installed on your machine in order to run the test suite
- Have at least a look at [Karate project](https://github.com/intuit/karate) documentation
> The project uses [gradle](https://gradle.org/) as build tool but it comes **bundled** in its [wrapper](gradle) so no need to have it installed in your machine 

## Execution
These are the steps needed to run the project in any Unix-based terminal.
The steps can be run equivalently with Windows machines replacing ```./gradlew``` by ``gradle`` in each command.

1) Clean old binaries & compile the project with:
    ```bash
    ./gradlew clean build
    ```
2) Run Karate service test suite with:
    ```bash
    ./gradlew test
    ```
    You will be able to check the [Cucumber reports generated](target/cucumber-html-reports/overview-tags.html)