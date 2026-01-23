FROM ghcr.io/aahl/zai-tts2api:main

COPY rootfs /

RUN apk add --no-cache jq
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
CMD tts2api