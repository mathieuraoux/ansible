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
    echo "${fist_name,,}.${last_name,,}-${hostname_digit} ansible_host=10.10.0.${ip_digit}" >> "${inventory_path}"
    echo -e "- hostname: \"${fist_name,,}.${last_name,,}-${hostname_digit}\"\n  network_ip: \"10.10.0.${ip_digit}\"\n  vmid: ${vmid}" >> "${yaml_path}"

}

# Init files
echo -e "[system]\nns3232007 ansible_host=10.30.0.2\n[students]" > 21_cesi_students_1.inv
echo -e "[system]\nns3232007 ansible_host=10.30.0.2\n[students]" > 22_cesi_students_2.inv

echo -e "---\n\nstudents_list:" > vars/students_1.yml
echo -e "---\n\nstudents_list:" > vars/students_2.yml

# Field files
cat ${cesi_students_1_filename} | while read line
do
    fist_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    hostname_digit=0

    for i in {1..3}
    do
        increase_variable
        add_line_in_yml 21_cesi_students_1.inv vars/students_1.yml
    done
done

cat ${cesi_students_2_filename} | while read line
do
    fist_name=$(echo ${line} | awk -F ";" '{ print $2 }')
    last_name=$(echo ${line} | awk -F ";" '{ print $1 }')
    hostname_digit=0

    for i in {1..3}
    do
        increase_variable
        add_line_in_yml 22_cesi_students_2.inv vars/students_2.yml
    done
done
