FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y apache2 && \
    apt install -y openjdk-17-jdk maven && \
    apt clean

WORKDIR /app

COPY . /app

RUN mvn clean package

RUN cp -r /app/target /var/www/html

EXPOSE 82

CMD ["apachectl", "-D", "FOREGROUND"]
