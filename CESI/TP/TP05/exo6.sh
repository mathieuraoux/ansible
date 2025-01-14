#! /bin/bash

num_random=$(( ( $RANDOM % 100 ) + 1))

echo $num_random
while true;
do
    read -p "Quel est le nombre aléatoire " num
    if [ ${num} -gt ${num_random} ];
    then
        echo "Le nombre est inférieur"
    elif [ ${num} -eq ${num_random} ];
    then
        echo "Vous avez trouvé"
        break
    elif [ ${num} -lt ${num_random} ];
    then
        echo "Le nombre est supérieur"
    fi
done
