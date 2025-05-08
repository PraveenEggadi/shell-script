#!/bin/bash

ID=$(id -u)

if [ ${ID} != 0 ]
then 
    echo "ERROR: Please run with root access"
else
    echo "Root user"
fi

yum install mysql -y