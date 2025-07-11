FROM ghcr.nju.edu.cn/senshinya/moontv:d6467db6cc487eb3fedbe77ff1c8263602941f45 AS builder
FROM ghcr.nju.edu.cn/basepkg/alpine

ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0

RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk add --no-cache bash curl jq nginx; \
    mkdir -p bashio; \
    wget https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz -O- | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio;

RUN apk add --no-cache nodejs;

COPY --from=builder --chown=0 /app /app
WORKDIR /app
ENV PORT=80
ENV HOSTNAME=0.0.0.0
ENV NODE_ENV=production
ENV DOCKER_ENV=true

COPY rootfs /
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["node", "server.js"]
HEALTHCHECK --interval=1m --start-period=30s CMD nc -zn 0.0.0.0 80 || exit 1