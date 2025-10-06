#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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
#unzip installation
dnf list installed unzip -y
if [ $? -ne 0 ]; then
    echo -e "$R NOT INSTALLED $N ::install the $2 on this system"
    dnf install unzip -y
    VALIDATE $? MYSQL
else    
    echo -e "$2 already installed $Y Skipping $N ...!"
fi
#tree installation
dnf list installed tree -y
if [ $? -ne 0 ]; then
    echo "NOT INSTALLED::install the $2 on this system"
    dnf install tree -y
    VALIDATE $? TREE
else    
    echo -e "$2 already installed $Y Skipping $N ...!"
fi
#nginx installation
dnf list installed nginx -y
if [ $? -ne 0 ]; then
    echo "NOT INSTALLED::install the $2 on this system"
    dnf install nginx -y
    VALIDATE $? NGINX
else    
    echo -e "$2 already installed $Y Skipping $N ...!"
fi




