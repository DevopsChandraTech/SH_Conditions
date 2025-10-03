#!/bin/bash
#check the user has root privilizes or not
#id -u
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: NEED TO RUN WITH ROOT USER PRIVILIZES"
    exit 1
fi
#FUNCTIONS
VALIDATE(){ #functions passing the variable as args like shell script args
if [ $1 -ne 0 ]; then
    echo "ERROR:: COMMAND NOT FOUND PLS CHECK ONCE THE COMMAND"
    exit 1
else 
    echo "SUCCESS:: $2 INSTALLATION IS SUCCESSFULL"
fi
}
#mysql installation
dnf install mysql -y
VALIDATE $? MYSQL
#unzip installation
dnf install unzip -y
VALIDATE $? UNZIP
dnf install tree -y
VALIDATE $? TREE
