#!/bin/bash

# IFS = internal field separator

file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "$R file: $file does not exist $N"
fi

while IFS=":" read -r username password userid groupid fullname home_dir shell_path
do
    echo "username: $username"
    echo "id: $userid"
    echo "full name: $fullname"

done < $file