# Use official n8n image
FROM n8nio/n8n:latest

# Become root to install system packages
USER root

# Install FFmpeg (Debian-based image)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Ensure runtime picks up Railway's PORT env if provided.
# n8n normally reads PORT environment variable; set a reasonable default.
ENV PORT=5678

# Expose default port (documentation/clarity)
EXPOSE 5678

# Switch back to the non-root user used by the n8n image
USER node

# Use the image's default entrypoint/cmd (do not override unless necessary)
# The container will use the image's default start command and pick up PORT at runtime.
