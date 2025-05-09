#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
TIMESTAMP= $(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 .... $R FAILED"
        exit 1
    else
        echo "$2 .... $G SUCCESS!"
    fi
}

if [ $ID != 0 ]
then 
    echo -e "$R ERROR: Run the script with ROOT access $N"
    exit 1
else
    echo -e "$G Root User $N"
fi

# echo "All Arguments passed: $@"

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? != 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$package is already installed... $Y SKIPPED $N"
    fi
done