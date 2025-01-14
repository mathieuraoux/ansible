#! /bin/bash


read -p "Quel est le chemin du répertoire à sauvegarder " save_to_path
read -p "Quel est le chemin du répertoire où déposer la sauvegarde " save_path

/bin/cp ${save_to_path} ${save_path} -r
