#!/usr/bin/env bash

# Declaring the color code variables
cyan='\033[0;36m'
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

echo -e "${cyan}Welcome!! You will now be able to generate the key files for your new environment/account. Please provide the below requested details${nc}"

# Read input variables
read -p 'environment: ' environment

my_dir="$(dirname "$0")"
if [ ! -d "${my_dir}/_ssh" ]; then
    mkdir "${my_dir}/_ssh"
fi

PUB_FILE=_ssh/"$environment"-env-key.pem.pub
KEY_FILE=_ssh/"$environment"-env-key.pem

# Conditional to generate the key files
if [ -f "$PUB_FILE" ] && [ -f "$KEY_FILE" ]; then
    echo -e "${red}Key files already exists!!${nc}"
    read -p 'Do you want to recreate this file:[Yes/No] ' response
    if [[ $(echo "$response" |tr [:upper:] [:lower:]) == "yes" ]] || [[ $(echo "$response" |tr [:upper:] [:lower:]) == "y" ]]; then
        ssh-keygen -N '' -f $KEY_FILE -t rsa -b 2048 <<< y
        echo -e "${green}Key Files created successfully!!${nc}"
    elif [[ $(echo "$response" |tr [:upper:] [:lower:]) == "no" ]] || [[ $(echo "$response" |tr [:upper:] [:lower:]) == "n" ]]; then
        echo -e "${red}Exiting the script without creating the new Key files${nc}"
    fi
else
    ssh-keygen -N '' -f $KEY_FILE -t rsa -b 2048 <<< y
    echo -e "${green}Key File created successfully!!${nc}"
fi
