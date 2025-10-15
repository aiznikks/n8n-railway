FROM n8nio/n8n:latest-debian

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

USER node
EXPOSE 5678
