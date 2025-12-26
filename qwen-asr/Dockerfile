FROM ghcr.nju.edu.cn/aahl/qwen-asr2api:main

COPY rootfs /

RUN chmod +x /run.sh
RUN apk add --no-cache jq

ENTRYPOINT ["/run.sh"]