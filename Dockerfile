FROM ubuntu:18.04

COPY ./docker /docker
COPY ./entrypoint.sh /entrypoint.sh

RUN useradd -m code && \
	mkdir /code && \
	chown -R code:code /code
ENTRYPOINT /entrypoint.sh

