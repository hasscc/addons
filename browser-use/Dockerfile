FROM ghcr.nju.edu.cn/aahl/buwu:2

COPY run.sh /
RUN chmod a+x /run.sh && \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install -y jq && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/run.sh"]
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
HEALTHCHECK --interval=1m CMD nc -zn 0.0.0.0 5901 || exit 1