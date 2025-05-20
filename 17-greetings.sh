#!/bin/bash

NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n, Specify name (mandatory)"
    echo " -w, Specify wishes, example, Good Morning"
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

if [ -z "$NAME" ] || [ -z "$WISHES" ];
then
    echo "ERROR: Both -n and -w are mandatory options."
    USAGE
    exit 1
fi

echo "Hello $Name. $Wishes. I am learning shell script."