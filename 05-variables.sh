#!/bin/bash

echo "Enter your username: "

read USERNAME # the value entered above will be assigned to USERNAME variable

echo "Username is:  ${USERNAME}"

echo "Enter your password: "

read -s PASSWORD # the value which user enters will not be visible in the terminal but its value will be assigned to the variable

echo "Password: ${PASSWORD}"

