#!/bin/bash
#check the user has root privilizes or not
#id -u
USER_ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILENAME="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER
echo "the script exectuing $date" | tee -a $LOG_FILENAME #append the execution file to log file

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
    echo -e "SUCCESS::$G $2 $N INSTALLATION IS $Y SUCCESSFULL $N "
    
fi
}
#using loops
    #check the package status if the package not installed then install the package 
    #$? -ne 0 then package not installed
    #if the package already installed then skip the package
    #$? -eq 0 then package already installed skipping..!
for package in $@
do
    dnf list installed $package &>>$LOG_FILENAME
    if [ $? -ne 0 ]; then
        echo "$package not installed"
        dnf install $package -y &>>$LOG_FILENAME
        VALIDATE $? $package
    else 
        echo -e "the $package already installed $Y Skipping $N"
    fi
done