#! /bin/bash

echo -e "1- Choix 1\n2- Choix 2\n3- Choix 3"
read choix
case ${choix} in
    1)
        echo "c'est le choix 1"
        ;;
    2)
        echo "c'est le choix 2"
        ;;
    3)
        echo "c'est le choix 3"
        ;;
    *)
        echo "Erreur la sélection doit être entre 1 et 3"
        ;;
esac
