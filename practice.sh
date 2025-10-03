#!/bin/bash
#check the user has root privilizes or not
#id -u
USER_ID=$(id -u)

if [$USER_ID -ne 0 ]; then
    echo "ERROR:: NEED TO RUN WITH ROOT USER PRIVILIZES"
fi
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR:: COMMAND NOT FOUND PLS CHECK ONCE THE COMMAND"
else 
    echo "SUCCESS:: MYSQL INSTALLATION IS SUCCESSFULL"
fi
