#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: user have not root privilizes"
    exit 1 # script exit if there error above
fi

#mysql installation:
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: fail the installaton"
    exit 1 # if fails the installation exit script here
fi

#nginx installation:
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: fail the installaton"
    exit 1 # if fails the installation exit script here
fi

#unzip installation:
dnf install unzip -y

if [ $? -ne 0 ]; then
    echo "ERROR:: fail the installaton"
    exit 1 # if fails the installation exit script here
fi