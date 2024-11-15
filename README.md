---
title: "hyl-zoneiot | Readmes"
---

# hyl-zoneiot

## Maintenance

Manipulate and update with
- . ~/hyl-zoneiot/src/updateReadmes.sh
- code ~/hyl-zoneiot/mkdocs.yml

- Git: https://github.com/jirihylmar/hyl-zoneiot.git
- Location: `~/hyl-zoneiot/README.md`

## Change Log

OPENED @hylmarj Wed Nov 13 12:00:12 CEST 2024 commnet

## MkDocs Implementation

**build on AWS Account**

299025166536 tomi nuke

**access**

https://main.d3mzmv7u6qg7cc.amplifyapp.com/

**run local**

```bash
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs danse4mobility/mkdocs-material:latest
```


```bash
# get and kill running
docker ps
docker kill $(docker ps -q)

# inspect it
docker exec -it <container_name_or_id> sh
```

## Helpers

creates, updates links, opens them in vs code

```sh
bash /home/hylmarj/hyl-zoneiot/src/createReferenceLinks.sh
```

creates TODO list

https://stackoverflow.com/questions/1251999/how-can-i-replace-a-newline-n-using-sed

```sh
cd $HOME/hyl-zoneiot/docs/; printf "# TODO (root)\n\n\`\`\`\n grep ^./ ~/hyl-zoneiot/docs/todo.md\n\`\`\`\n\n----\n\n" > todo.md; grep -nr "TODO @" . | sed ':a;N;$!ba;s/\n/\n\n----\n\n/g' >> todo.md
```

## Docker Build

1. Create a new clean directory

```bash
mkdir -p ~/mkdocs-new && cd ~/mkdocs-new
```

2. Create Dockerfile

```bash
cat > Dockerfile << 'EOF'
FROM squidfunk/mkdocs-material:latest

Install system dependencies
RUN apk add --no-cache \
    git \
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

EOF
```

# Create minimal Amplify configuration

```bash
cat > amplify.yml << 'EOF'
version: 1.0
frontend:
  phases:
    build:
      commands:
        - export PATH="$PATH:/root/.local/bin"
        - docker run --rm -v ${PWD}:/docs danse4mobility/mkdocs-material:latest build
  artifacts:
    baseDirectory: site
    files:
      - '**/*'
  cache:
    paths: 
      - ~/.cache/pip
      - ~/.local/lib/python3.10/site-packages
EOF
```

# Build the Docker image

```bash
docker build -t danse4mobility/mkdocs-material:latest .
```

Test the build

```bash
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs danse4mobility/mkdocs-material
```

If everything works, tag and push

```bash
docker login
docker push danse4mobility/mkdocs-material:latest
```

# Settings Amplify


