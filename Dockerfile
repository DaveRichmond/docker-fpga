FROM ubuntu:18.04 AS ghdl-build
RUN apt update && \
	apt install -y build-essential gcc make git gnat zlib1g-dev
WORKDIR /tmp
RUN git clone https://github.com/ghdl/ghdl
RUN cd ghdl && \
	./configure --prefix=/usr/local && \
	make && \
	make install

FROM ubuntu:18.04

COPY ./docker /docker
COPY ./entrypoint.sh /entrypoint.sh

RUN apt update && \
	apt install -y build-essential make cmake gnat && \
	apt clean

COPY --from=ghdl-build /usr/local /usr/local

RUN useradd -m code && \
	mkdir /code && \
	chown -R code:code /code
ENTRYPOINT ["/bin/bash", "-i", "/entrypoint.sh"]

