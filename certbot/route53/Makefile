AUTHOR=dqio
IMAGE=certbot-route53

TAG=${AUTHOR}/${IMAGE}

all: docker-build 

docker-build: docker-build-certbot-route53

docker-build-certbot-route53:
	docker build -t ${TAG}:latest ./
