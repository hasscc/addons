FROM ghcr.nju.edu.cn/basepkg/nginx-lua:1.27-alpine

ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0

RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk add --no-cache bash unzip jq; \
    mkdir -p bashio; \
    wget -O - https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio;

RUN set -eux; \
    wget https://${GITHUB_DOMAIN}/LibreSpark/LibreTV/archive/refs/heads/main.zip; \
    unzip main.zip; \
    install -m 755 LibreTV-main/docker-entrypoint.sh /docker-entrypoint.sh; \
    cp -f LibreTV-main/nginx.conf /etc/nginx/conf.d/default.conf; \
    mkdir -p /usr/share/nginx; \
    mv LibreTV-main /usr/share/nginx/html; \
    rm -rf *.zip;

COPY rootfs /
RUN chmod a+x /run.sh

CMD ["/run.sh", "nginx", "-g", "daemon off;"]
HEALTHCHECK --interval=1m --start-period=30s CMD nc -zn 0.0.0.0 80 || exit 1