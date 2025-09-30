#!/bin/bash
USER=$(id -u)
if [ $USER -nq 0 ];then
    echo "Error:: user has not root priviliges"
else
    echo "pls install the application"
fi
dnf install -y
if [ $? -eq 0 ];then
    echo "Success:: the installation"
else
    echo "Error:: not installing the app"
fi