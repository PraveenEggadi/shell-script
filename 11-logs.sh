#!/bin/bash

ID=$(id -u)

echo "Script-name: $0"
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m" # Red color
G="\e[32m" #Green  color
N="\e[0m" #Normal colour

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR: $2 has $R FAILED $N"
        exit 1
    else
        echo "$2 $G SUCCESS $N!"
    fi
}

if [ ${ID} != 0 ]
then 
    echo "$R ERROR: Please run with root access $N"
    exit 1
else
    echo "$G Root user $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySQL"

yum install git -y &>> ${LOGFILE}

VALIDATE $? "Installing GIT"