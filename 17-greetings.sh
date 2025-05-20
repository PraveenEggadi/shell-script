#!/bin/bash

NAME=""
WISHES="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n, Specify name (mandatory)"
    echo " -w, Specify wishes. (Optional). Default is Good Morning"
    echo " -h, Display Help and exit"
}
while getopts ":n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "Invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :) USAGE; exit;;
        h) USAGE; exit;;
    esac

done

# if [ -z "$NAME" ] || [ -z "$WISHES" ]; this condition checks for both fields as they are mandatory
if [ -z "$NAME" ]  # now name is mandatory and wishes are optional
then
    # echo "ERROR: Both -n and -w are mandatory options."
    echo "ERROR: -n is mandatory."
    USAGE
    exit 1
fi

echo "Hello $NAME. $WISHES. I am learning shell script."