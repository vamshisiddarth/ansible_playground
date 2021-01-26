#!/usr/bin/env bash
my_dir="$(dirname "$0")"

LIST=`ls $my_dir/group_vars`
#echo $LIST
FILE="vault.yaml"
CONFIG="config.yaml"

for dir in $LIST ; do
    # create vault.yaml file if doesn't exists
    if [ ! -f "$my_dir/group_vars/$dir/$FILE" ]; then
      touch "$my_dir/group_vars/$dir/$FILE"
      echo "created vault file in $dir"
    fi

    # create config.yaml file if doesn't exists
    if [ ! -f "$my_dir/group_vars/$dir/$CONFIG" ]; then
      touch "$my_dir/group_vars/$dir/$CONFIG"
      echo "created config file in $dir"
    fi

    # encrypt or decrypt the group_vars
    if [ "$1" == "encrypt" ]; then
        ansible-vault encrypt "$my_dir/group_vars/$dir/$FILE" --vault-password-file "$my_dir/vault-password.txt"
    elif [ "$1" == "decrypt" ]; then
        ansible-vault decrypt "$my_dir/group_vars/$dir/$FILE" --vault-password-file "$my_dir/vault-password.txt"
    else
        echo "Invalid Argument! Please try encrypt or decrypt"
    fi
done

