FROM ubuntu:latest as build

WORKDIR /build

RUN true \
	&& apt-get update -y \
	&& apt-get install -y \
		build-essential \
		nasm

ADD Makefile .
ADD main.asm .

RUN make

# ---

FROM ubuntu:latest

RUN true \
	&& apt-get update -y \
	&& apt-get install -y \
		bash \
		xxd \
		tweak \
		binutils \
		gdb

RUN true \
	&& groupadd kid \
	&& useradd -m -g kid kid

USER kid

WORKDIR /home/kid

COPY --chown=kid --from=build /build/a.out /home/kid/the-cave

RUN true \
	&& echo '/home/kid/the-cave' >> .bashrc \
	&& echo 'echo ""' >> .bashrc

ENTRYPOINT ["/bin/bash"]
