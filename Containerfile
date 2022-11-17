FROM ubuntu

RUN set -ex; \
  apt-get update && \
  apt-get -y install --no-install-recommends \
    ca-certificates \
    bash \
    git \
    curl \
    unzip

COPY . /app
WORKDIR /app

RUN set -ex; \
  ./install
  
