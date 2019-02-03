build: main.c
	gcc main.c

image: Dockerfile main.c
	docker build -t pdparchitect/mario-says .

run:
	docker run -it pdparchitect/mario-says

publish:
	docker push pdparchitect/mario-says:latest
