mario: main.c
	gcc main.c

image: Dockerfile main.c
	docker build -t mario-says .

run:
	docker run -it mario-says
