FROM alpine:latest

USER root

COPY etc/tor/torrc /etc/tor/torrc

RUN apk update && apk add tor \
    && chown -R tor /etc/tor

USER tor

CMD ["tor", "-f", "/etc/tor/torrc"]
