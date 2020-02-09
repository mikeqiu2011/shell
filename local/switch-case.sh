#!/bin/bash

case ${1} in
start)
  echo starting...
  ;;
stop)
  echo stoping...
  ;;
status)
  echo status is: ...
  ;;
*)
  echo wrong input
  exit 1
  ;;
esac
