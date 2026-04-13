FROM debian:bookworm-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      tinyproxy gettext-base ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY tinyproxy.conf.template /app/tinyproxy.conf.template
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
