#!/bin/bash
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
    echo "Error::User has not root privilizes"
    exit 1
fi
#Using functions
VALIDATE(){
if [ $1 -ne 0 ]; then
    echo "Error::Command not found..! pls check once the command"
    exit 1
else
    echo "Success:: $2 installed Successfuly"
fi  
}
#command check 
#unzip installation
dnf install unzip -y
VALIDATE $? MYSQL
#tree installation
dnf install tree -y
VALIDATE $? TREE
#nginx installation
dnf install nginx -y
VALIDATE $? NGINX



