FROM openjdk:jre-slim

MAINTAINER Marta Arcones "marta.arcones@gmail.com"

RUN apt-get update && apt-get install -y git nginx nodejs && rm -rf /var/lib/apt/lists/*  ##de verdad hace falta el jodido node

RUN git clone https://github.com/arcones/karate-apiDaysMad19.git

RUN cd karate-apiDaysMad19 && java -jar karate.jar *

RUN rm -v /etc/nginx/nginx.conf
RUN cp karate-apiDaysMad19/nginx.conf /etc/nginx/

RUN cp -r karate-apiDaysMad19/target/cucumber-html-reports/* /usr/share/nginx/html/ ##quitar y ponerlo en el fichero de configuracion

RUN ls -lrt /usr/share/nginx/html/

RUN cp -r karate-apiDaysMad19/target/cucumber-html-reports /var/www/html/
 
RUN echo "daemon off;" >> /etc/nginx/nginx.conf ##quitar y ponerlo a capon

EXPOSE 90 

CMD service nginx start