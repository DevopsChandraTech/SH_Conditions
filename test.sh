#!/bin/bash
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo test.sh | cut -d "." -f1)
LOG_FILENAME="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

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
dnf list installed unzip -y &>>LOG_FILENAME
if [ $? -ne 0 ]; then
    echo -e "$R NOT INSTALLED $N ::install the $2 on this system"
    dnf install unzip -y &>>LOG_FILENAME
    VALIDATE $? MYSQL
else    
    echo -e "$2 already installed $Y Skipping $N ...!" &>>LOG_FILENAME
fi
#tree installation
dnf list installed tree -y &>>LOG_FILENAME
if [ $? -ne 0 ]; then
    echo -e "$2 NOT INSTALLED::install the $2 on this system" &>>LOG_FILENAME
    dnf install tree -y &>>LOG_FILENAME
    VALIDATE $? TREE
else    
    echo -e "$2 already installed $Y Skipping $N ...!" &>>LOG_FILENAME
fi
#nginx installation
dnf list installed nginx -y &>>LOG_FILENAME
if [ $? -ne 0 ]; then
    echo -e "NOT INSTALLED::install the $2 on this system" &>>LOG_FILENAME
    dnf install nginx -y &>>LOG_FILENAME
    VALIDATE $? NGINX
else    
    echo -e "$2 already installed $Y Skipping $N ...!" &>>LOG_FILENAME
fi




