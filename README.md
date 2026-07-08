# ttyd-ssh

`ttyd` 컨테이너를 실행하면 지정한 서버로 SSH 접속을 바로 시작하는 이미지입니다.

## Image

```text
ghcr.io/YOUR_GITHUB_USERNAME/ttyd-ssh:latest
```

## Portainer Stack 예시

```yaml
services:
  ttyd-ssh:
    image: ghcr.io/YOUR_GITHUB_USERNAME/ttyd-ssh:latest
    container_name: ttyd-ssh
    restart: unless-stopped
    ports:
      - "${TTD_PUBLIC_PORT:-7681}:7681"
    environment:
      TTYD_PORT: 7681
      SSH_USER: ${SSH_USER}
      SSH_HOST: ${SSH_HOST}
      SSH_PORT: ${SSH_PORT:-22}
      STRICT_HOST_KEY_CHECKING: ${STRICT_HOST_KEY_CHECKING:-accept-new}
```

## Portainer Environment variables

```env
TTD_PUBLIC_PORT=7681
SSH_USER=ubuntu
SSH_HOST=192.168.1.10
SSH_PORT=22
STRICT_HOST_KEY_CHECKING=accept-new
```

## GitHub Actions

`main` 브랜치에 push하면 자동으로 GHCR에 이미지를 빌드/푸시합니다.
매주 일요일 03:00 UTC에도 재빌드하여 베이스 이미지 업데이트를 반영합니다.
