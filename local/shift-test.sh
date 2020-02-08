#!/bin/bash

while [[ $# -gt 0 ]]; do
  for VAR in $@; do
    echo $VAR
  done
  echo
  shift
done
