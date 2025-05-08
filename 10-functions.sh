#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "ERROR: Installing MySQl has failed"
        exit 1
    else
        echo "Installation Success!"
    fi
}

if [ ${ID} != 0 ]
then 
    echo "ERROR: Please run with root access"
    exit 1
else
    echo "Root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE