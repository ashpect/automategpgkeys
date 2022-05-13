!/bin/bash

#Getting the keys and storing it in an array keys[i]
#storingkeys () {
    line=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print }'|wc -l|bc)
    line2=$line
    totalkeys=$line
    declare -a keys
    while [ $line -gt 0 ];
    do
        keys[line]=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print }'|cut -b 15-30|sed "${line}q;d")
        ((line--))             
    done
#}

#Giving user option to choose key from the index
choosekey () {
    echo
    echo "Choose which key would you like to use."
    echo "Order : latest is at the top"
    while [ $line2 -gt 0 ];
    do
        index=$((totalkeys+1-line2))
        echo $index. ${keys[line2]}
        ((line2--))
    done
}

#Terminate the program
terminateprog() {
    echo "--------Thank you for using gpgautomation--------"
    exit
    #terminate program 
}

#Using the key to commit on git
gitcommit() {
    gpg --armor --export $key
    echo
    echo "PLEASE ADD THE PUBLIC KEY ON GITHUB.COM=>SETTINGS=>GPG AND SSH KEYS=>GPG KEYS"
    echo "ONLY PROCEED IF THIS STEP IS DONE..!!"
    echo
    echo "Do you want to add the key globally(press 0) or for signing in this repo only(press 1) ?" 
    read boolean
    if [ $boolean -eq 0 ];
    then 
        git config --global user.signingkey $key
        echo "This key will be now used to sign any futhur commits."
    elif [ $boolean -eq 1 ];
    then
        git config user.signingkey $key
        echo "This key will be used to sign the commits of this repo only."
    fi
}

askforgit () {
    #ask if they want to use the key for git
    echo
    echo "Do you want to :"
    echo "1.Use this key for github commits"
    echo "2.Access the public key block"
    echo "3.Exit ??"
    read gitvalue
    if [ $gitvalue -eq 1 ]
    then
        gitcommit
        exit 2
    elif [ $gitvalue -eq 2 ]
    then
        gpg --armor --export $key
        echo "--------Thank you for using gpgautomation--------"
        exit 3
    else
        echo "--------Thank you for using gpgautomation--------"
        exit 4
    fi
}

echo "--------------Welcome to gpg automation-----------------"
if [ $totalkeys -eq 0 ]
then
    echo "We have detected that you have no keys setup."
    echo "Would you like to"
    echo "1.Set up a new key"
    echo "0.Exit"
else
    echo "Would you like to : "
    echo "1.Set up a new key"
    echo "2.Access an existing key"
    echo "0.Exit"
fi
read value

if [ $value -eq 2 ];
then
    #storekeys
    #storingkeys
    #choose keys index from array
    choosekey
    read keyindex
    key=${keys[totalkeys-keyindex+1]}
    askforgit
    exit 1
elif [ $value -eq 1 ];
then
    #createkey
    gpg --full-gen-key
    #nowstoringkeysagain---------------
    line=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print }'|wc -l|bc)
    line2=$line
    totalkeys=$line
    declare -a keys
    while [ $line -gt 0 ];
    do
        keys[line]=$(gpg --list-secret-keys --keyid-format=long|awk '/sec/{print }'|cut -b 15-30|sed "${line}q;d")
        ((line--))             
    done
    #accessthelatestkeyadded-------------
    key=${keys[totalkeys]}
    #showthekey
    askforgit
else
    echo "--------Thank you for using gpgautomation--------"
    exit 5
fi

#RANDOM TIPS
#All variables are global scope, even if mentioned in fucn , unless specified explicitely.