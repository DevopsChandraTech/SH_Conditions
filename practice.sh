#!/bin/bash
# installing the sql nginx unzip python3 using script

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: installed user has no root privilizes"
    exit 1
fi

#mysql installation
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: the command not found"
    exit 1
else
    echo "Success:: the installation successful"
fi
