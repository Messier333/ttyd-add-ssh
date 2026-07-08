FROM tsl0922/ttyd:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client ca-certificates \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7681

CMD ["sh", "-c", "ttyd -p ${TTYD_PORT:-7681} ssh -o StrictHostKeyChecking=${STRICT_HOST_KEY_CHECKING:-accept-new} -p ${SSH_PORT:-22} ${SSH_USER}@${SSH_HOST}"]
