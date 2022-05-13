Script file serves 2 purposes :
    Making genration and access of public keys for gpg easier.
    Using existing key or making a new key for git commits easier.

# FLOW OF CODE :
1. Check if gpg keys exist or not.<br>
    IF YES 
        Ask the user if he wants to create a new key or exit ?
    IF NO
        Ask the user if he wants to create a new key, access already existing keys or exit ?
2. If user requires new key
    a. Generate new keys
    b. Add keys in array and access the latest key as variable 'key'
    c. Ask if he would like to use this key for git commits, or just access the public key or exit
        i. If he wants to use it for git commit, then
            1. Ask if he wants the key to be used globally or for the repo
            2. Execute command based on response
            3. Exit
        ii. If he wants to access public keys, generate and print public keys and Exit.
        iii. Exit if user choses so.
3. If the user wants to access an existing key ,
    a. Add keys in array 
    b. Ask him the index of array corresponding to key
    c. Add the key as variable 'key'
    c. Ask if he would like to use this key for git commits, or just access the public key or exit
        i. If he wants to use it for git commit, then
            1. Ask if he wants the key to be used globally or for the repo
            2. Execute command based on response
            3. Exit
        ii. If he wants to access public keys, generate and print public keys and Exit.
        iii. Exit if user choses so.
4. If the user wants to directly exit, Exit.