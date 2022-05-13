Script file serves 2 purposes :
    Making genration and access of public keys for gpg easier.
    Using existing key or making a new key for git commits easier.

# FLOW OF CODE :
1. Check if gpg keys exist or not.<br>
    IF YES <br>
        Ask the user if he wants to create a new key or exit ?<br>
    IF NO<br>
        Ask the user if he wants to create a new key, access already existing keys or exit ?
2. If user requires new key
    1. Generate new keys
    2. Add keys in array and access the latest key as variable 'key'
    3. Ask if he would like to use this key for git commits, or just access the public key or exit
        1. If he wants to use it for git commit, then
            1. Ask if he wants the key to be used globally or for the repo
            2. Execute command based on response
            3. Exit
        2. If he wants to access public keys, generate and print public keys and Exit.
        3. Exit if user choses so.
3. If the user wants to access an existing key ,
    1. Add keys in array 
    2. Ask him the index of array corresponding to key
    3. Add the key as variable 'key'
    4. Ask if he would like to use this key for git commits, or just access the public key or exit
        1. If he wants to use it for git commit, then
            1. Ask if he wants the key to be used globally or for the repo
            2. Execute command based on response
            3. Exit
        2. If he wants to access public keys, generate and print public keys and Exit.
        3. Exit if user choses so.
4. If the user wants to directly exit, Exit.