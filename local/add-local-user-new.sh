#!/bin/bash

# Enforces that it be executed with superuser (root) privileges.  If the script is not executed with superuser privileges it will not attempt to create a user and returns an exit status of 1.
if [[ "${UID}" -ne 0 ]]; then
  echo "the script shall be run as root"
  exit 1
fi

# Provides a usage statement much like you would find in a man page if the user does not supply an account name on the command line and returns an exit status of 1.
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 USER_NAME [COMMENT]..."
  exit 1
fi

# Uses the first argument provided on the command line as the username for the account.  Any remaining arguments on the command line will be treated as the comment for the account.
USER_NAME=$1
shift 1
COMMENT=$*

# Automatically generates a password for the new account.
SPEC=$(echo "!@#$%^&*()_+" | fold -w1 | shuf | head -c1)
PASS=$(date +%s%N | sha256sum | head -c20)
PASS=${PASS}${SPEC}

# Informs the user if the account was not able to be created for some reason.  If the account is not created, the script is to return an exit status of 1.
useradd -c "${COMMENT}" -m "${USER_NAME}"

if [[ $? -ne 0 ]]; then
  echo "user creation failed"
  exit 1
fi

echo ${PASS} | passwd --stdin ${USER_NAME}
passwd -e ${USER_NAME}

echo
echo "user name is: ${USER_NAME}"
echo "initial password is ${PASS}"
echo

exit 0
