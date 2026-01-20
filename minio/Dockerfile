FROM alpine:latest

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN apk update && \
    apk add minio minio-client && \
    chmod +x /docker-entrypoint.sh && \
    addgroup -g 1000 storage && \
    adduser -u 1000 -D -S -G storage storage && \
    mkdir -p /home/storage/data && \
    chown storage:storage /home/storage/data

HEALTHCHECK CMD mcli ready local

WORKDIR /home/storage/data

ENTRYPOINT ["/docker-entrypoint.sh"]

USER storage

CMD ["minio", "server", "/home/storage/data", "--console-address", ":9001"] 
