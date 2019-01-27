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

COPY --from=build /build/a.out /bin/mario-says

RUN true \
	&& groupadd mario \
	&& useradd -m -g mario mario

USER mario

WORKDIR /home/mario

RUN true \
	&& echo '/bin/mario-says' >> .bashrc \
	&& echo 'echo "Use strings, xxd and tweak to change what /bin/mario-says"' >> .bashrc

ENTRYPOINT ["/bin/bash"]
