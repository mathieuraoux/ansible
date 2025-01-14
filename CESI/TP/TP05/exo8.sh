#! /bin/bash

mkdir exo8_rep -p

for i in {1..100};
do
    touch exo8_rep/fichier_${i}
done


tar -cvf exo8_rep_$(date +%y-%m-%d) exo8_rep
scp -i exo8.key exo8_$(date +%y-%m-%d) root@10.10.0.252:/tmp/
