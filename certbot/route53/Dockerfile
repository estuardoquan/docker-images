FROM alpine:latest

COPY ./crontab /etc/crontabs/root
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --update --no-cache \
        python3 \ 
        py3-pip \
        py3-wheel \
        py3-cryptography \
        py3-requests \
        py3-boto3 \
        curl \
        ca-certificates \
        tzdata && \
    #
    pip3 install --no-cache-dir --break-system-packages \
        certbot \
        certbot-dns-route53 && \
    #
    chmod +x /docker-entrypoint.sh && \
    #
    mkdir -p /etc/letsencrypt

WORKDIR /etc/letsencrypt

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/crond", "-f"]
