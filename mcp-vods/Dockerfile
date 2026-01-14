FROM ghcr.nju.edu.cn/aahl/mcp-vods

ENV TRANSPORT=sse

COPY rootfs /

RUN apk add --no-cache bash jq
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["uv", "run", "-m", "mcp_vods"]