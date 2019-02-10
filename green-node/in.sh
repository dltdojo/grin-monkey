#!/bin/bash
#set -x

cd "$(dirname "$0")"

start() {
  init 
  sleep 3
  info
  wallet-listen &
  grin --usernet
}

init() {
    grin --usernet wallet init <<< $'alicepass\nalicepass'
}

info() {
    grin --usernet wallet info <<< $'alicepass'
}

wallet-listen() {
    grin --usernet wallet -e listen <<< $'alicepass'
}


case "$1" in 
    start)   start ;;
    init)   init ;;
    info)   info ;;
    wallet-listen)   wallet-listen ;;
    *) echo "usage: $0 init|info|start|wallet-listen" >&2
       exit 1
       ;;
esac