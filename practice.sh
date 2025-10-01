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
    echo -e "Success:: the $2 installation \e[32m Successful $N"
fi

}

#mysql installation:
dnf install mysql -y
VALIDATE $? mysql

#nginx installation:
dnf install nginx -y
VALIDATE $? nginx

#unzip installation:
dnf install unzip -y
VALIDATE $? unzip

