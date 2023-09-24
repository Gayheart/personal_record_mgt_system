#!/bin/bash

# FUNCTIONS

# main_menu function: navigate to desired task
function main_menu(){
    case "$1" in
        1) backups_menu;;
        2) credentials_menu;;
        3)notes_menu;;
    esac
}

# Backups menu:  access backup utilities
function backups_menu(){
    while true; do
        echo -e "\nSelect back up option"
        echo "1. Back up files"
        echo "2. Compressed backup, select destination"
        echo "3. To main menu"
        echo "4. Exit"

        read -p "Enter option: " backup_option
        case $backup_option in
            1)./backup_script.sh;;
# or 1)source backup_script.sh
            2) echo "Note: work on this in next devt"; return;;
            3) return;;
            4) exit 0;;
            *) echo "Invalid option";;
        esac
     done
}

source credentials_notes.sh

# PROGRAM

function main(){
    while true; do
        # list out items in prs
        echo -e  "\nWelcome to the Personal Record System"
        echo -e "Select one of the following by entering the number attached\
        \n1. Backup\
        \n2. Credentials\
        \n3. Notes\
        \n4. Exit"

        # Take input
        read -p "Enter option no.: " option

        # check input, access main menu, exit program
        
        case ${option} in
            1|2|3) main_menu ${option};;
            4) exit 0;;
            *) echo "Invalid option";;
        esac
    done
} 


# RUN IT
main
