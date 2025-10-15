# Start from the official n8n image
FROM n8nio/n8n

# Switch to the root user to install packages
USER root

# Update package lists and install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the non-root 'node' user for security
USER node
