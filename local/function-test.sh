#!/bin/bash

function log() {
  # echo ${0}
  if [[ "$VERBOSE" = 'true' ]]; then
    local MESSAGE="${@}"
    echo "${MESSAGE}"
  fi
}

log "hello mike" "hi andrew"

VERBOSE='true'
log "hi frank"
