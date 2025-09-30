#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ];then
    echo "Error:: user has not root priviliges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "Error:: fail the mysql installation"
    exit 1
fi