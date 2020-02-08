#!/bin/bash

# PASS="${RANDOM}${RANDOM}${RANDOM}"
# PASS=$(date +%s%N | sha256sum | head -c23)
# # echo "${PASS}"

# SPECIAL_CHAR=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
# PASS="${PASS}${SPECIAL_CHAR}"

# echo ${PASS}

echo "the dir name is $(dirname ${0}), the basename is $(basename ${0})"

echo "the parameter you passed in is $#"

if [[ $# -lt 1 ]]; then
  echo "Usage: ${0} USER_NAME [USER_NAME]..."
  exit 1
fi

for VAR in $@; do
  echo $VAR
done

while condition; do

done
