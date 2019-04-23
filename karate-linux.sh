#!/bin/bash

git clone https://github.com/arcones/karate-apiDaysMad19.git

##Hacerlo luego sin suponer que java está instalado

cd karate-apiDaysMad19 && java -jar karate.jar * && xdg-open target/cucumber-html-reports/overview-features.html