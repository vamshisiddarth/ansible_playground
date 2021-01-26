#!/usr/bin/env bash

# Declaring the color code variables
cyan='\033[0;36m'
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

echo -e "${cyan}Welcome!! You will now be able to generate the credential file for your new environment/account. Please provide the below requested details${nc}"

# Read input variables
read -p 'environment: ' environment
read -p 'aws_access_key_id: ' uservar
read -p 'aws_secret_access_key: ' passvar
read -p 'iam_role_arn: ' rolevar

my_dir="$(dirname "$0")"
if [ ! -d "${my_dir}/inventory" ]; then
    mkdir "${my_dir}/inventory"
fi

FILE=inventory/"$environment"_aws_ec2.yaml

# Function to create the inventory credential file
generate_file()
{
    cat <<EOF >inventory/"$environment"_aws_ec2.yaml
# https://docs.ansible.com/ansible/latest/plugins/inventory/aws_ec2.html
plugin: amazon.aws.aws_ec2
cache: False
strict: False
strict_permissions: False

aws_access_key_id: "$uservar"
aws_secret_access_key: "$passvar"
iam_role_arn: "$rolevar"

regions:
  - eu-west-1
  - eu-west-2
hostnames:
  - private-ip-address
  - ip-address
  - dns-name
keyed_groups:
  # Add e.g. x86_64 hosts to an arch_x86_64 group
  - prefix: arch
    key: 'architecture'
  # Add hosts to tag_Name_Value groups for each Name/Value tag pair
  - prefix: tag
    key: tags
  # Add hosts to e.g. instance_type_z3_tiny
  - prefix: instance_type
    key: instance_type
  # Create security_groups_sg_abcd1234 group for each SG
  - key: 'security_groups|json_query("[].group_id")'
    prefix: 'security_groups'
  # Create a group for each value of the Application tag
  - key: tags.application
    separator: ''
  # Create a group per region e.g. aws_region_us_east_2
  - key: placement.region
    prefix: region
# Set individual variables with compose
compose:
  # Use the private IP address to connect to the host
  # (note: this does not modify inventory_hostname, which is set via I(hostnames))
  ansible_host: private_ip_address
EOF
}

# Conditional to generate the credential file
if [[ -f "$FILE" ]]; then
    echo -e "${red}Inventory file already exists!!${nc}"
    read -p 'Do you want to recreate this file:[Yes/No] ' response
    if [[ $(echo "$response" |tr [:upper:] [:lower:]) == "yes" ]] || [[ $(echo "$response" |tr [:upper:] [:lower:]) == "y" ]]; then
        generate_file
        echo -e "${green}Inventory Credential File created successfully!!${nc}"
    elif [[ $(echo "$response" |tr [:upper:] [:lower:]) == "no" ]] || [[ $(echo "$response" |tr [:upper:] [:lower:]) == "n" ]]; then
        echo -e "${red}Exiting the script without creating the new Inventory file${nc}"
    fi
else
    generate_file
    echo -e "${green}Inventory Credential File created successfully!!${nc}"
fi
