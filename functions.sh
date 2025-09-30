#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: user have not root privilizes"
    exit 1 # script exit if there error above
fi
VALIDATE(){ #functions taken inputs as a args like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: fail the installaton"
        exit 1 # if fails the installation exit script here
    else
        echo "Success:: the $2 installation"
    fi
}
#mysql installation:
dnf install mysql -y
VALIDATE $? mysql
#nginx installation:
dnf install nnginx -y
VALIDATE $? nginx
#unzip installation:
dnf install unzip -y
VALIDATE $? unzip