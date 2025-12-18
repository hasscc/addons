FROM ghcr.nju.edu.cn/basepkg/alpine

ARG VERSION=0.8.1
ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0
ENV ANDROID_HOME=/config/.android

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache bash curl jq nodejs npm python3 android-tools nginx && \
    npm config set registry https://registry.npmmirror.com && \
    npm install -g pnpm node-gyp; \
    mkdir -p bashio; \
    wget https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz -O- | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio;

COPY rootfs /
WORKDIR /app
RUN wget https://${GITHUB_DOMAIN}/NetrisTV/ws-scrcpy/archive/refs/tags/v$VERSION.tar.gz -O- | tar zxvf - --strip 1 -C /app

RUN set -eux; \
    apk add --no-cache --virtual .build-deps make g++; \
    npm install; \
    npm run dist; \
    rm -rf node_modules package-lock.json; \
    npm install --production; \
    rm -rf /root/.npm /tmp/*; \
    apk del --no-cache .build-deps; \
    chmod a+x /run.sh; \
    mkdir -p "$ANDROID_HOME"; \
    ln -s "$ANDROID_HOME" /root/.android; \
    pwd;

CMD ["/run.sh", "node", "dist/index.js"]
HEALTHCHECK --interval=1m --start-period=30s CMD nc -zn 0.0.0.0 8000 || exit 1
