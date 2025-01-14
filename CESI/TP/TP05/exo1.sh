#! /bin/bash


id
id_num=$(echo $UID)
if [ ${id_num} -eq 0 ];
then
    echo "Vous etes root c'est bon"
else
    echo "Erreur vous n'etes pas root, vous devez etre root pour faire cette commande"
fi
