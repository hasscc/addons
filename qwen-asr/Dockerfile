FROM ghcr.nju.edu.cn/aahl/qwen-asr2api:main

COPY rootfs /

RUN apk add --no-cache jq
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
CMD qwen3asr2api