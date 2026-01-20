#!/bin/sh

CERTBOT_DOMAIN=${CERTBOT_DOMAIN:?"ERROR: CERTBOT_DOMAIN env not present"}
CERTBOT_EMAIL=${CERTBOT_EMAIL:-noreply@$CERTBOT_DOMAIN}

CERTBOT_WILDCARD=${CERTBOT_WILDCARD:-0}
CERTBOT_STAGING=${CERTBOT_STAGING:-0}

function init () {
    set -- --dns-route53 \
        --agree-tos \
        --no-eff-email \
        --email $CERTBOT_EMAIL \
        -d $CERTBOT_DOMAIN
    
    if [[ ${CERTBOT_WILDCARD} == 1 || ${CERTBOT_WILDCARD} == true ]]; then
        set -- ${@} \
            -d "*.${CERTBOT_DOMAIN}"
    fi

    if [[ ${CERTBOT_STAGING} == 1 || ${CERTBOT_STAGING} == true ]]; then
        set -- ${@} \
            --server "https://acme-staging-v02.api.letsencrypt.org/directory"
    else
        set -- ${@} \
            --server "https://acme-v02.api.letsencrypt.org/directory"
    fi

    certbot certonly ${@}

    return 0
}

if [ ! -d "/etc/letsencrypt/live" ]; then
    init
else
    printf "%s: %s\n" "ALERT" "CERTBOT already initialized"
fi

exec "${@}"
