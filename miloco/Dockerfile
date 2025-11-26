# Set pip index URL.
# For Worldwide:
# - https://pypi.org/simple/
# For China:
# - https://mirrors.aliyun.com/pypi/simple/
# - https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
ARG PIP_INDEX_URL=https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple


################################################
# Frontend Builder
################################################
FROM ghcr.nju.edu.cn/basepkg/node:20-slim AS frontend-builder

ARG VERSION=main
ARG GITHUB_DOMAIN=ghrp.hacs.vip

WORKDIR /app
RUN set -eux; \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources; \
    apt update && apt install -y wget; \
    wget https://${GITHUB_DOMAIN}/XiaoMi/xiaomi-miloco/archive/$VERSION.tar.gz -O- | tar zxvf - --strip 1 -C .; \
    sed -i 's/enable_audio: bool = False,/enable_audio: bool = True,/' miot_kit/miot/camera.py; \
    sed -i 's/= MIoTCameraVideoQuality.LOW,/= MIoTCameraVideoQuality.HIGH,/' miot_kit/miot/camera.py; \
    cp -rf /app/web_ui /; \
    npm config set registry https://registry.npmmirror.com

WORKDIR /web_ui
RUN npm install
RUN npm run build


################################################
# Backend
################################################
FROM ghcr.nju.edu.cn/basepkg/python:3.12-slim AS backend

# Restate PIP index URL.
ARG PIP_INDEX_URL

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory.
WORKDIR /app

# Copy app files.
COPY --from=frontend-builder /app/miloco_server/pyproject.toml /app/miloco_server/pyproject.toml
COPY --from=frontend-builder /app/miot_kit/pyproject.toml /app/miot_kit/pyproject.toml

# Install dependencies
RUN pip config set global.index-url "${PIP_INDEX_URL}" \
    && pip install --upgrade pip setuptools wheel \
    && pip install --no-build-isolation /app/miloco_server \
    && pip install --no-build-isolation /app/miot_kit \
    && rm -rf /app/miloco_server \
    && rm -rf /app/miot_kit

# Copy app files.
COPY --from=frontend-builder /app/miloco_server /app/miloco_server
COPY --from=frontend-builder /app/config/server_config.yaml /app/config/server_config.yaml
COPY --from=frontend-builder /app/config/prompt_config.yaml /app/config/prompt_config.yaml
COPY --from=frontend-builder /app/scripts/start_server.py /app/start_server.py
COPY --from=frontend-builder /app/miot_kit /app/miot_kit

# Install project.
RUN pip install --no-build-isolation -e /app/miloco_server \
    && pip install --no-build-isolation -e /app/miot_kit \
    && rm -rf /app/miloco_server/static \
    && rm -rf /app/miloco_server/.temp \
    && rm -rf /app/miloco_server/.log

# Update frontend dist.
COPY --from=frontend-builder /web_ui/dist/ /app/miloco_server/static/


ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.17.0

ENV BACKEND_PORT=28800 \
    BACKEND_LOG_LEVEL=warning \
    MILOCO_SERVER_STORAGE_DIR=/config/miloco_server

COPY rootfs /
RUN set -eux; \
    chmod a+x /run.sh; \
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
HEALTHCHECK --interval=1m --start-period=30s CMD nc -zn 0.0.0.0 ${BACKEND_PORT:-8000} || exit 1