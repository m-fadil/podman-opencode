FROM debian:bookworm-slim

# Install bash dan dependencies yang diperlukan
RUN apt-get update && apt-get install -y bash curl git

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

# Set environment PATH untuk OpenCode
ENV PATH="/root/.opencode/bin:${PATH}"

# Set working directory
WORKDIR /workspace
