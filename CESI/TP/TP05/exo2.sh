#! /bin/bash

ma_variable=0

for i in {1..20};
do  
    ma_variable=$((${ma_variable} + 1))
    echo ${ma_variable}
done
