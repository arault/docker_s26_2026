FROM debian:13

COPY data.txt /

# Installation de Redis
RUN apt update
RUN apt install -y redis-server

EXPOSE 6379/tcp

RUN useradd -m -s /bin/bash camille

USER camille

WORKDIR /home/camille/