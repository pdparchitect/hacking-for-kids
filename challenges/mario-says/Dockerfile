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
	&& groupadd kid \
	&& useradd -m -g kid kid

USER kid

WORKDIR /home/kid

COPY --chown=kid --from=build /build/a.out /home/kid/mario-says

RUN true \
	&& echo '/home/kid/mario-says' >> .bashrc \
	&& echo 'echo "Use strings, xxd and tweak to change what mario-says"' >> .bashrc

ENTRYPOINT ["/bin/bash"]
