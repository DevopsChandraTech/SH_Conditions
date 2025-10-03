#!/bin/bash
#check the user has root privilizes or not
#id -u
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: NEED TO RUN WITH ROOT USER PRIVILIZES"
    exit 1
fi
#FUNCTIONS
VALIDATE(){ #functions passing the variable as args like shell script args
if [ $1 -ne 0 ]; then
    echo -e "ERROR:: COMMAND NOT FOUND PLS CHECK ONCE THE $R ERROR COMMAND $N"
    exit 1
else 
    echo -e "SUCCESS::$G $2 $N INSTALLATION IS $G SUCCESSFULL $N "
    echo -e "$Y SUCCESSFULL $N"
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
