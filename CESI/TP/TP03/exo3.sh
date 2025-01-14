#! /bin/bash

read -p "Quel est le fichier que je dois trouver ? " file_name
find . -iname ${file_name}
