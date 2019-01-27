FROM ubuntu:latest as build

WORKDIR /build

RUN true \
	&& apt-get update -y \
	&& apt-get install -y \
		build-essential

ADD Makefile .
ADD main.c .

RUN make

# ---

FROM ubuntu:latest

RUN true \
	&& apt-get update -y \
	&& apt-get install -y \
		bash \
		xxd \
		tweak \
		binutils

RUN true \
	&& groupadd mario \
	&& useradd -m -g mario mario

USER mario

WORKDIR /home/mario

COPY --from=build /build/a.out /home/mario/mario-says

RUN true \
	&& echo '/home/mario/mario-says' >> .bashrc \
	&& echo 'echo "Use strings, xxd and tweak to change what /home/mario/mario-says"' >> .bashrc

ENTRYPOINT ["/bin/bash"]
