#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -nq 0 ];then
    echo "Error:: user has not root priviliges"
fi

dnf install mysql -y

if [ $? -eq 0 ];then
    echo "Success:: the installation"
