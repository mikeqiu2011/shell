#!/bin/bash

function usage() {
  echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
  echo "generate a random password"
  echo "  -l LENGTH specify the password length"
  echo "  -s        specify if need special charactar"
  exit 1
}

while getopts vl:s OPTION; do
  case $OPTION in
  v)
    echo 'verbose model enabled'
    ;;
  l)
    echo 'length specified'
    LENGTH="${OPTARG}"
    ;;
  s)
    echo "special enabled"
    USE_SPECIAL_CHAR='true'
    ;;
  ?)
    usage
    ;;
  esac

done
