FROM ghcr.nju.edu.cn/xiaomi/miloco-backend:v0.1.1

ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0

ENV BACKEND_PORT=28800 \
    MILOCO_SERVER_STORAGE_DIR=/config/miloco_server

COPY rootfs /
RUN set -eux; \
    chmod a+x /run.sh; \
    sed -i 's/= MIoTCameraVideoQuality.LOW,/= MIoTCameraVideoQuality.HIGH,/' miot_kit/miot/camera.py; \
    \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
    apt update; \
    apt install -y bash curl wget tar jq nginx netcat-openbsd; \
    \
    mkdir -p bashio; \
    wget https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz -O- | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/run.sh"]
CMD ["python3", "start_server.py"]
HEALTHCHECK --interval=1m --start-period=20s CMD nc -zn 0.0.0.0 ${BACKEND_PORT:-8000} || exit 1