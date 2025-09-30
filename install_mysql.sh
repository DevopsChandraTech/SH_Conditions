#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ];then
    echo "Error:: user has not root priviliges"
    exit 1 # if script fails then exit here not proceed further
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "Error:: fail the mysql installation"
    exit 1 # if script fails then exit here not proceed further
fi