#!/bin/bash
#set -x

cd "$(dirname "$0")"

start() {
  grin --usernet
}

init() {
    grin --usernet wallet init <<< $'alicepass\nalicepass'
}

info() {
    grin --usernet wallet info <<< $'alicepass'
}

case "$1" in 
    start)   start ;;
    init)   init ;;
    info)   info ;;
    *) echo "usage: $0 init|info|start" >&2
       exit 1
       ;;
esac