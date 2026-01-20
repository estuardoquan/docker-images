AUTHOR=dqio
IMAGE=php

TAG=${AUTHOR}/${IMAGE}

all: docker-build 

docker-build: docker-build-php-fpm docker-build-php-test

docker-build-php-fpm:
	docker build -t ${TAG}:latest -f ./main ./Dockerfiles

docker-build-php-dev:
	docker build -t ${TAG}:dev -f ./dev ./Dockerfiles
