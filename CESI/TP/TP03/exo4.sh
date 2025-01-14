#! /bin/bash

echo -e "Quelle opération voulez-vous faire ?\n1- addition\n2- soustraction\n3- multiplication\n4- division\n"
read choix

read -p "Quel est le premier nombre ? " num1
read -p "Quel est le deuxième nombre ? " num2

case ${choix} in
   1)
        result=$(($num1 + $num2))
        ;; 
    2)
        result=$(($num1 - $num2))
        ;; 
    3)
        result=$(($num1 * $num2))
        ;; 
    4)
        result=(($num1 / $num2))
        
        ;;
    *)
        echo "Erreur vous devez choisir entre 1 et 4"
        ;;
esac

echo "Result: ${result}"
