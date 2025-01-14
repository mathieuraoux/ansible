#! /bin/bash

ls exo7 | while read line;
do
    digit=$(echo $line | awk -F '_' '{ print $2 }')
    if [ $((digit%2)) -ne 0 ];
    then
        rm -f exo7/${line}
    fi
done
