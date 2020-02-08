#!/bin/bash

#Enforces that it be executed with superuser (root) privileges.  If the script is not executed with superuser privileges it will not attempt to create a user and returns an exit status of 1.
if [[ "${UID}" -ne 0 ]]; then
  echo "not root user"
  exit 1
fi

# Prompts the person who executed the script to enter the username (login), the name for person who will be using the account, and the initial password for the account.
read -p "enter user name: " USER_NAME
read -p "enter real name: " COMMENT
read -p "enter initial password: " INIT_PASS

# Creates a new user on the local system with the input provided by the user.
useradd -c "${COMMENT}" ${USER_NAME}

# Informs the user if the account was not able to be created for some reason.  If the account is not created, the script is to return an exit status of 1.
if [[ ${?} -ne 0 ]]; then
  echo "user creation failed"
  exit 1
fi

#set passwd
echo "${INIT_PASS}" | passwd --stdin ${USER_NAME}
passwd -e ${USER_NAME}

# Displays the username, password, and host where the account was created.  This way the help desk staff can copy the output of the script in order to easily deliver the information to the new account holder.
echo "User name is: ${USER_NAME}"
echo "Password is: ${INIT_PASS}"
echo "Host is: $(hostname)"
