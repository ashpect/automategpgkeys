#!/bin/bash
echo "Hello !Welcome to gpg key setup."
echo "Do you wish to create a new key(press 0) or use an existing key(press 1) ??"
read enteredvalue
if [ $enteredvalue -eq 0 ];
then
        gpg --full-gen-key
        key=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{if (length($2)>0) print $2}')
        newKey= "-n $key | tail -c 16"
        gpg --armor --export $newKey
        echo "Now copy the key and go to github=>settings=>gpgkeys and it"
        echo "Do you want to add the key globally(press 0) or for signing in this repo only(press 1) ?"
        read boolean
    if [ $boolean -eq 0 ];
    then 
        git config --global user.signingkey $newkey
        echo "This key will be now used to sign any futhur commits."
    elif [ $boolean -eq 1 ];
    then
        git config user.signingkey $newkey
        echo "This key will be used to sign the commits of this repo only."
    fi
elif [ $enteredvalue -eq 1 ];
then
    gpg --list-secret-keys --keyid-format=long
    echo "Choose and copy your key and give it as input"
    read keyvalue2
    echo "Do you want to add the key globally(press 0) or for signing in this repo only(press 1) ?"
    read boolean
    if [ $boolean -eq 0 ];
    then 
        git config --global user.signingkey $keyvalue2
        echo "This key will be now used to sign any futhur commits."
    elif [ $boolean -eq 1 ];
    then
        git config user.signingkey $keyvalue2
        echo "This key will be used to sign the commits of this repo only."
    fi
fi