AUTHOR=dqio
IMAGE=noip

TAG=${AUTHOR}/${IMAGE}

all: docker-build

docker-build: docker-build-noip-duc docker-build-noip

docker-build-noip-duc:
	docker build -t ${TAG}:build --target noip-duc ./

docker-build-noip:
	docker build -t ${TAG}:latest --target noip ./
