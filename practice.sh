#!/bin/bash
# installing the sql nginx unzip python3 using script

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: installed user has no root privilizes"
    exit 1
fi

VALIDATE(){ #functions take inputs as args like shell script args

if [ $1 -ne 0 ]; then
    echo "ERROR:: the command not found"
    exit 1
else
    echo -e "Success:: the $2 installation \e[32m Successful \e[33m"
fi
}

#mysql installation:
dnf list installed mysql 
if [ $? -ne 0 ]; then
    echo -e "ERROR:: $2 not installed into this system \e[31m"
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo -e "SUCCESS:: $2 already installed \e[33m SKIPPING \e[0m"
fi
#nginx installation:
if [ $? -ne 0 ]; then
    echo -e "ERROR:: $2 not installed into this system \e[31m Failure \e[0m"
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e "SUCCESS:: $2 already installed \e[33m SKIPPING \e[0m"
fi
#unzip installation:
if [ $? -ne 0 ]; then
    echo -e "ERROR:: $2 not installed into this system \e[31m Failure \e[0m"
    dnf install unzip -y
    VALIDATE $? unzip
else
    echo -e "SUCCESS:: $2 already installed \e[33m SKIPPING \e[0m"
fi
#unzip installation:
if [ $? -ne 0 ]; then
    echo -e "ERROR:: $2 not installed into this system \e[31m Failure \e[0m"
    dnf install python3 -y
    VALIDATE $? python3
else
    echo -e "SUCCESS:: $2 already installed \e[33m SKIPPING \e[0m"
fi