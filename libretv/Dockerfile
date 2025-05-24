FROM ghcr.nju.edu.cn/basepkg/nginx-lua:1.27-alpine

RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories; \
    apk add --no-cache unzip jq; \
    wget https://ghrp.hacs.vip/LibreSpark/LibreTV/archive/refs/heads/main.zip; \
    unzip main.zip; \
    install -m 755 LibreTV-main/docker-entrypoint.sh /docker-entrypoint.sh; \
    cp -f LibreTV-main/nginx.conf /etc/nginx/conf.d/default.conf; \
    mkdir -p /usr/share/nginx; \
    mv LibreTV-main /usr/share/nginx/html; \
    rm main.zip;

COPY run.sh /
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK --interval=1m CMD nc -zn 0.0.0.0 80 || exit 1