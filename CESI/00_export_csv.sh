#! /bin/bash

# Init variables
cesi_students_1_filename=$(ls *1.csv)
cesi_students_2_filename=$(ls *2.csv)
ip_digit=200
vmid=300
hostname_digit=0

function increase_variable(){
    ip_digit=$((ip_digit+1))
    vmid=$((vmid+1))
    hostname_digit=$((hostname_digit+1))
}

function add_line_in_yml(){
    inventory_path=$1
    yaml_path=$2
    echo "${first_name,,}.${last_name,,}-${hostname_digit} ansible_host=10.10.0.${ip_digit}" >> "${inventory_path}"
    echo -e "- hostname: \"${first_name,,}.${last_name,,}-${hostname_digit}\"\n  network_ip: \"10.10.0.${ip_digit}\"\n  vmid: ${vmid}\n  password: \"${password}\"\n  user: \"${first_name,,}.${last_name,,}\"" >> "${yaml_path}"

}

# Init files
echo -e "[system]\nns3232007 ansible_host=10.30.0.2\n[students]" > 21_cesi_students_1.inv
echo -e "[system]\nns3232007 ansible_host=10.30.0.2\n[students]" > 22_cesi_students_2.inv

echo -e "---\n\nstudents_list:" > vars/students_1.yml
echo -e "---\n\nstudents_list:" > vars/students_2.yml

# Field files
cat ${cesi_students_1_filename} | while read line
do
    first_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    password=$(echo ${line} | awk -F ";" '{ print $3 }')
    hostname_digit=0

    for i in {1..3}
    do
        increase_variable
        add_line_in_yml 21_cesi_students_1.inv vars/students_1.yml
    done
done

cat ${cesi_students_2_filename} | while read line
do
    first_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    password=$(echo ${line} | awk -F ";" '{ print $3 }')
    hostname_digit=0

    for i in {1..3}
    do
        increase_variable
        add_line_in_yml 22_cesi_students_2.inv vars/students_2.yml
    done
done


cat ${cesi_students_1_filename} | while read line
do
    first_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    password=$(echo ${line} | awk -F ";" '{ print $3 }')
    hostname_digit=0

    mkdir /root/mail -p
    
    echo "Bonjour ${first_name}," > /root/mail/${first_name}.${last_name}.txt
    echo >> /root/mail/${first_name}.${last_name}.txt
    echo "Un compte a été créé avec le login ${first_name,,}.${last_name,,} et le mot de passe: \"${password}\""  >> /root/mail/${first_name}.${last_name}.txt
    echo "Ce compte peut-être utilisé sur le Proxmox https://horus.raoux.ovh:8006 ." >> /root/mail/${first_name}.${last_name}.txt
    echo "Vous avez 3 machines de TP pour vous ${first_name,,}.${last_name,,}-1 ${first_name,,}.${last_name,,}-2 ${first_name,,}.${last_name,,}-3 le mot de passe /root de ces machines est CESI2024 ." >> /root/mail/${first_name}.${last_name}.txt
    echo "Il est possible de se connecter en SSH à ces machines via le serveur VPN dont les instructions ont été envoyé sur le mail de la promo" >> /root/mail/${first_name}.${last_name}.txt
    echo "Pas besoin de connaître l'IP une entrée DNS existe correspondant au nom de la machine" >> /root/mail/${first_name}.${last_name}.txt
    echo >> /root/mail/${first_name}.${last_name}.txt
    echo "Cordialement," >> /root/mail/${first_name}.${last_name}.txt
    echo "Mathieu RAOUX" >> /root/mail/${first_name}.${last_name}.txt

done

cat ${cesi_students_2_filename} | while read line
do
    first_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    password=$(echo ${line} | awk -F ";" '{ print $3 }')
    hostname_digit=0

    mkdir /root/mail -p
    
    echo "Bonjour ${first_name}," > /root/mail/${first_name}.${last_name}.txt
    echo >> /root/mail/${first_name}.${last_name}.txt
    echo "Un compte a été créé avec le login ${first_name,,}.${last_name,,} et le mot de passe: \"${password}\""  >> /root/mail/${first_name}.${last_name}.txt
    echo "Ce compte peut-être utilisé sur le Proxmox https://horus.raoux.ovh:8006 ." >> /root/mail/${first_name}.${last_name}.txt
    echo "Vous avez 3 machines de TP pour vous ${first_name,,}.${last_name,,}-1 ${first_name,,}.${last_name,,}-2 ${first_name,,}.${last_name,,}-3 le mot de passe /root de ces machines est CESI2024 ." >> /root/mail/${first_name}.${last_name}.txt
    echo "Il est possible de se connecter en SSH à ces machines via le serveur VPN dont les instructions ont été envoyé sur le mail de la promo" >> /root/mail/${first_name}.${last_name}.txt
    echo "Pas besoin de connaître l'IP une entrée DNS existe correspondant au nom de la machine" >> /root/mail/${first_name}.${last_name}.txt
    echo >> /root/mail/${first_name}.${last_name}.txt
    echo "Cordialement," >> /root/mail/${first_name}.${last_name}.txt
    echo "Mathieu RAOUX" >> /root/mail/${first_name}.${last_name}.txt

done

