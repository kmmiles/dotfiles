FROM ubuntu:jammy
WORKDIR /app

COPY provision/base provision/base
RUN set -ex \
  && ./provision/base

COPY . .
RUN set -ex \
  && useradd -m -s /bin/zsh docker \
  && chown -R docker /app

USER docker
RUN set -ex \
  && SHELL=zsh ./install
