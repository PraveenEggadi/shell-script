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
        echo -e "ERROR: $2 has $R FAILED $N"
        exit 1
    else
        echo -e "$2 $G SUCCESS $N!"
    fi
}

if [ ${ID} != 0 ]
then 
    echo -e "$R ERROR: Please run with root access $N"
    exit 1
else
    echo -e "$G Root user $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySQL"

yum install git -y &>> ${LOGFILE}

VALIDATE $? "Installing GIT"