FROM fedora

RUN set -ex; \
  dnf install -y ca-certificates bash procps git curl unzip

COPY . /app
WORKDIR /app

RUN set -ex; \
  ./install
