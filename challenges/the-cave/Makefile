build: main.asm
	nasm -f elf64 main.asm -o a.o
	ld a.o -o a.out 

image: Dockerfile main.asm
	docker build -t pdparchitect/the-cave .

run:
	docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it pdparchitect/the-cave

publish:
	docker push pdparchitect/the-cave:latest
