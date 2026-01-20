FROM rust:alpine AS noip-duc

ARG NOIP_VERSION=noip-duc_3.3.0

RUN apk update && \
    apk add --no-cache build-base && \
    mkdir -p /build && \
    cd /build && \ 
    wget https://dmej8g5cpdyqd.cloudfront.net/downloads/${NOIP_VERSION}.tar.gz && \
    tar xf ${NOIP_VERSION}.tar.gz && \
    cd ${NOIP_VERSION} && \
    cargo build --release

FROM alpine:latest AS noip

ARG NOIP_VERSION=noip-duc_3.3.0

COPY --from=noip-duc /build/${NOIP_VERSION}/target/release/noip-duc /usr/local/bin/noip

CMD ["noip"]
