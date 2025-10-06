#!/bin/bash
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Error::User has not root privilizes"
    exit 1
fi
#command check 
#unzip installation
dnf install unzip -y
if [ $? -ne 0 ]; then
    echo "Error::Command not found..! pls check once the command"
    exit 1
fi

#tree installation
dnf install tree -y
if [ $? -ne 0 ]; then
    echo "Error::Command not found..! pls check once the command"
    exit 1
fi

#nginx installation
dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "Error::Command not found..! pls check once the command"
    exit 1
fi



