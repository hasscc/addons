FROM ghcr.nju.edu.cn/basepkg/alpine

ARG VERSION=0.8.1

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache unzip nodejs npm make g++ python3 android-tools jq && \
    npm install -g pnpm node-gyp

RUN set -eux; \
    wget https://github.com/NetrisTV/ws-scrcpy/archive/refs/tags/v$VERSION.zip; \
    unzip *.zip; \
    mv ws-scrcpy-$VERSION /app; \
    rm -rf *.zip

COPY run.sh /
WORKDIR /app

RUN set -eux; \
    npm install; \
    npm run dist; \
    rm -rf node_modules package-lock.json; \
    npm install --production; \
    chmod a+x /run.sh; \
    pwd

VOLUME /root/.android

ENTRYPOINT ["/run.sh"]
CMD ["node", "dist/index.js"]
HEALTHCHECK --interval=1m CMD nc -zn 0.0.0.0 8000 || exit 1
