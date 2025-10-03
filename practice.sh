#!/bin/bash
#check the user has root privilizes or not
#id -u
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: NEED TO RUN WITH ROOT USER PRIVILIZES"
    exit 1
fi
#mysql installation
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR:: COMMAND NOT FOUND PLS CHECK ONCE THE COMMAND"
    exit 1
else 
    echo "SUCCESS:: MYSQL INSTALLATION IS SUCCESSFULL"
fi
#unzip installation
dnf installl unzip -y
if [ $? -ne 0 ]; then
    echo "ERROR:: COMMAND NOT FOUND PLS CHECK ONCE THE COMMAND"
    exit 1
else 
    echo "SUCCESS:: UNZIP INSTALLATION IS SUCCESSFULL"
fi
