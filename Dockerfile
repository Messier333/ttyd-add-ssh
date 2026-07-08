FROM tsl0922/ttyd:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client \
    && rm -rf /var/lib/apt/lists/*

USER ttyd
