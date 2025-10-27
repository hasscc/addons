FROM ghcr.nju.edu.cn/basepkg/mcphub:0.9.16

ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0

COPY rootfs /
RUN set -eux; \
    chmod a+x /run.sh; \
    rm -rf /app/mcp_settings.json; \
    ln -sf /config/mcphub.json /app/mcp_settings.json; \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
    apt update; \
    apt install -y bash curl wget tar jq nginx netcat-openbsd; \
    mkdir -p bashio; \
    wget https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz -O- | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/run.sh"]
CMD ["pnpm", "start"]
HEALTHCHECK --interval=1m --start-period=10s CMD nc -zn 0.0.0.0 3000 || exit 1