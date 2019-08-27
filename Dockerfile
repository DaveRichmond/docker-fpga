FROM ubuntu:18.04

COPY ./docker /docker
COPY ./entrypoint.sh /entrypoint.sh

RUN apt update && \
	apt install -y build-essential make cmake

RUN useradd -m code && \
	mkdir /code && \
	chown -R code:code /code
ENTRYPOINT ["/bin/bash", "-i", "/entrypoint.sh"]

