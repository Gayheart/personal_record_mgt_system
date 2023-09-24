#!/bin/bash

# Variables
email_file="./Personal_Record_System/credentials/email_addresses.txt"
passwd_file="./Personal_Record_System/credentials/passwords.txt"
username_file="./Personal_Record_System/credentials/usernames.txt"

# Credentials and Notes parts of the prs.sh code

# Credentials menu
function credentials_menu(){
    while true; do

        # print options to console
        echo -e "\nSelect one of the following actions on credentials"
        echo "1. Find User by email/username"
        echo "2. Add User"
        echo "3. Delete User"
        echo "4. Generate report"
        echo "5. To main menu"
        echo "6. Exit" 

        # Take input and act
        read -p "Enter option: " cred_option
        case $cred_option in
            1)find_user_cred;;
            2)echo add_user;;
            3)echo del_user;;
            4)echo gen_report;;
            5)return;;
            6)exit;;
            *) echo "Invalid input";;
        esac
 
    done
}

# Notes menu
function notes_menu(){
    while true; do

        # print options to console
        echo -e "\nSelect one of the following actions on Notes"
        echo "1. Find in text"
        echo "2. Add to text"
        echo "3. Export text"
        echo "4. To main menu"
        echo "5. Exit" 

        # Take input and act
        read -p "Enter option: " notes_option
        case "$notes_option" in
            1)echo find_user;;
            2)echo add_user;;
            3)echo export_text;;
            4)return;;
            5)exit;;
            *) echo "Invalid input";;
        esac
 
    done
}

function find_user_cred(){
    # search by username or email prompt
    read -ep "Search by 1. Username OR 2.email: " find_opt
    # search using find_line_num, handle not found,else print name/ addr
    if [[ "$find_opt" == 1 ]]; then
        read -p "Enter Username: " username
        echo $(get_line_num "$username" "$username_file")
 
   elif [[ "$find_opt" == 2 ]]; then
        echo by email
    else
        echo wrong input
    fi

}


# Get the line number
function get_line_num(){
    # variables
    local results=()
    local search_str="$1"
    local file="$2"
    local counter=1

    # parse through for lines with search
    while read -r line; do
        if [[ "$line" =~ *"$search_str"*  ]]; then
            results+="$counter"
        fi
        ((counter++))
    done < "$file"
    # return results
    return ${results[@]}

}

#tst i
cat  $username_file
get_line_num "Lawoe" "$username_file"
