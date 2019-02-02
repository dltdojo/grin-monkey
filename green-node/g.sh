#!/bin/bash
#set -x

cd "$(dirname "$0")"


if [[ $(file .env) =~ CRLF ]]
then
  echo "Check .env line endings always LF not CRLF."
  exit -1
fi

set -a
source .env
set +a


info() {
    echo $VERSION
}

build() {
    docker-compose build
}

case "$1" in 
    build)   build ;;
    info)   info ;;
    *) echo "usage: $0 info|build|help" >&2
       exit 1
       ;;
esac