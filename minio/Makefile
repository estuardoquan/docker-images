AUTHOR=dqio
IMAGE=minio

TAG=${AUTHOR}/${IMAGE}

all: docker-build

docker-build: docker-build-minio

docker-build-minio:
	docker build -t ${TAG}:latest ./


