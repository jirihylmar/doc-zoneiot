FROM squidfunk/mkdocs-material:latest

# Install system dependencies including Amplify requirements
RUN apk add --no-cache \
    curl \
    git \
    openssh \
    bash \
    python3 \
    py3-pip \
    texmf-dist \
    texlive-full \
    build-base \
    libffi-dev \
    openssl-dev

# Install additional Python packages
RUN pip install --no-cache-dir \
    mkdocs-git-revision-date-plugin \
    mkdocs-git-revision-date-localized-plugin \
    boto3 \
    mkdocstrings \
    mkdocs-include-markdown-plugin \
    mkdocs-gen-files \
    mkdocs-bibtex \
    mkdocs-print-site-plugin \
    git+https://github.com/aleksan4eg/markdown-lightbox.git

# Create entry point script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'set -e' >> /entrypoint.sh && \
    echo 'git config --global --add safe.directory /docs' >> /entrypoint.sh && \
    echo 'if [ ! -d .git ]; then' >> /entrypoint.sh && \
    echo '    git init' >> /entrypoint.sh && \
    echo '    git config --global user.email "docker@example.com"' >> /entrypoint.sh && \
    echo '    git config --global user.name "Docker"' >> /entrypoint.sh && \
    echo '    git add .' >> /entrypoint.sh && \
    echo '    git commit -m "Initial commit"' >> /entrypoint.sh && \
    echo 'fi' >> /entrypoint.sh && \
    echo 'if [ "$1" = "serve" ]; then' >> /entrypoint.sh && \
    echo '    exec mkdocs serve --dev-addr=0.0.0.0:8000' >> /entrypoint.sh && \
    echo 'else' >> /entrypoint.sh && \
    echo '    exec mkdocs "$@"' >> /entrypoint.sh && \
    echo 'fi' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

WORKDIR /docs
EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve"]