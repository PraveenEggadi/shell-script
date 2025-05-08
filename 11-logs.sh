#!/bin/bash

ID=$(id -u)

echo "Script-name: $0"
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR: $2 has failed"
        exit 1
    else
        echo "$2 Success!"
    fi
}

if [ ${ID} != 0 ]
then 
    echo "ERROR: Please run with root access"
    exit 1
else
    echo "Root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MySQL"

yum install git -y &>> ${LOGFILE}

VALIDATE $? "Installing GIT"