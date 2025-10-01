#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: run script with root user privilizes"
fi

dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "server not installed into this system"
    dnf install mysql -y
else    
    echo -e "mysql already exists \e[33m skipping...!"
fi

