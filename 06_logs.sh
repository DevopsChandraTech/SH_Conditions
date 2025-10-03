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
#mysql installation
dnf list installed mysql &>>$LOG_FILENAME
if [ $? -ne 0 ];then
	echo "mysql not installed proceed with installation"
	dnf install mysql -y &>>$LOG_FILENAME
	VALIDATE $? mysql
else
	echo -e "$B $2 $N already installed $Y Skipping...!$N" tee &>>$LOG_FILENAME
fi
#unzip installation
dnf list installed unzip &>>$LOG_FILENAME
if [ $? -ne 0 ];then
	echo "unzip not installed proceed with installation"
	dnf install unzip -y &>>$LOG_FILENAME
	VALIDATE $? UNZIP
else
	echo -e "$B $2 $N already installed $Y Skipping...!$N" tee &>>$LOG_FILENAME
fi
#tree installation
dnf list installed tree &>>$LOG_FILENAME
if [ $? -ne 0 ];then
	echo "tree not installed proceed with installation"
	dnf install tree -y &>>$LOG_FILENAME
	VALIDATE $? TREE
else
	echo -e "$B $2 $N already installed $Y Skipping...!$N" tee &>>$LOG_FILENAME
fi
#python3 installation
dnf list installed python3 &>>$LOG_FILENAME
if [ $? -ne 0 ];then
	echo "python3 not installed proceed with installation"
	dnf install python3 -y &>>$LOG_FILENAME
	VALIDATE $? PYTHON3
else
	echo -e "$B $2 $N already installed $Y Skipping...!$N" tee &>>$LOG_FILENAME
fi

