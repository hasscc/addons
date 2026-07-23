FROM ghcr.nju.edu.cn/aahl/claude-code:2.1.112

ARG GITHUB_DOMAIN=ghrp.hacs.vip
ARG BASHIO_VERSION=v0.18.1

ENV HOME=/data \
    XDG_CONFIG_HOME=/data/.config \
    XDG_CACHE_HOME=/data/.cache \
    XDG_STATE_HOME=/data/.local/state \
    XDG_DATA_HOME=/data/.local/share \
    CLAUDE_LAUNCH_CMD='claude --permission-mode auto' \
    CLAUDE_CONFIG_DIR=/data/.claude \
    DISABLE_AUTOUPDATER=claude \
    WEB_PORT=7680 \
    TTYD_PORT=7681 \
    npm_config_registry=https://registry.npmmirror.com \
    pnpm_config_registry=https://registry.npmmirror.com \
    UV_INDEX_URL=https://mirrors.ustc.edu.cn/pypi/simple \
    PATH="${HOME:-/data}/.local/bin:$PATH"

WORKDIR /config
COPY rootfs /

RUN set -eux; \
    chmod a+x /run.sh; \
    chmod a+x /opt/bin/*; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk add --no-cache bash tmux ttyd unzip netcat-openbsd; \
    apk add --no-cache ripgrep fzf procps; \
    mkdir -p bashio; \
    wget https://${GITHUB_DOMAIN}/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz -O- | tar zxvf - --strip 1 -C bashio; \
    mv bashio/lib /usr/lib/bashio; \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio; \
    rm -rf bashio; \
    case "$(uname -m)" in \
        amd64|x86_64)  ARCH="amd64" ;; \
        arm64|aarch64) ARCH="aarch64" ;; \
    esac; \
    wget -O /usr/bin/ha https://${GITHUB_DOMAIN}/home-assistant/cli/releases/latest/download/ha_${ARCH}; \
    chmod a+x /usr/bin/ha; \
    cd /opt/image-service; \
    npm install; \
    cd -;

ENTRYPOINT ["/run.sh"]
CMD ["/opt/bin/ttyd-claude"]
HEALTHCHECK --interval=1m --start-period=30s CMD nc -zn 0.0.0.0 7680 || exit 1