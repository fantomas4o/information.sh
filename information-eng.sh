# Author     : Fedya Serafiev
# Version    : 1.3
# License    : MIT
# Copyright  : Fedya Serafiev (2023)
# Github     : https://github.com/fantomas4o/information.sh
# Contact    : https://urocibg.eu/

#!/bin/bash

# Colors

zeleno="\e[32;1m"
jylto="\e[33m"
_reset="\e[0m"
_novo="\e[0;1;38;5;220m"
cherveno="\e[0;91m"
svetlosinio="\e[0;96m"

ttext=$(echo -e "$chervenoChoose an option:$_reset")

# Function to display the menu
show_menu() {
    echo "======================"
    echo -e "$zeleno the script!$_reset"
    echo "======================"

    echo -e "$_novo an option:$_reset"
    echo "---------------"
    echo "i - Display your real (external) ip"
    echo "f - Display information about your system"
    echo "u - Update the system"
    echo "s - Execute scripts in order: 1,2,3,4,5"
    echo "m - Display menu with available operations"
    echo "h - Show help"
    echo "q - Exit"
    echo "k - Display information about the script"
    echo -e "\n"
}

# Function to display help
show_help() {
    echo "==============================="	
    echo "Welcome to the help section:"
    echo "==============================="
    echo "i - Display your real (external) ip"
    echo "f - Display information about your system"
    echo "u - Execution of the 'u' option - system update."
    echo "s - Execute scripts in order: 1,2,3,4,5"
    echo "m - Display menu with available operations"
    echo "h - Show help"
    echo "q - Exit"
    echo "k - Display information about the script"
    echo "To choose an option, type the letter in front of it and press Enter."
}

# Function for updating the system
update_system() {
    echo "Performing system update..."
    sudo apt update
    sudo apt dist-upgrade -y
    echo "System updated successfully!"
}

show_menu  # Display the menu for the first time

while true; do
    read -p "$ttext " choice
    case $choice in	    
		i)
            echo "Your real (external) ip is:"
            qwe=$(curl -s icanhazip.com)
            echo -e "${jylto}${qwe}${_reset}"	   
            	   
            ;;			
		f)
            echo "Information about your system"
            inxi -C -m -G  -n	   
            ;; 
         k)
            echo ""
            echo -e "I created this Bash script that provides a convenient way to perform various system operations through an interactive menu.\n This script is designed to assist the user.\n
$svetlosinio Note:$_reset\n
The script can be expanded and improved in various ways, such as adding new options, etc.\nThis is a basic example that can be customized and modified according to specific user requirements and needs."
            echo ""
            ;;
			
		m)
            show_menu
            ;;
        u)
            update_system
            ;;
        s)
            echo "Scripts for selection:"
            scripts=("ka4i" "fedia" "Script 3" "Script 4" "Script 5")
            for i in "${!scripts[@]}"; do
                echo "$i - ${scripts[$i]}"
            done

            read -p "Select a script number: " script_number
            if [[ $script_number -ge 0 && $script_number -lt ${#scripts[@]} ]]; then
                selected_script=${scripts[$script_number]}
                case $script_number in
                    0)
                        echo "Starting ka4i.sh..."
                        bash ka4i.sh
                        ;;
                    1)
                        echo "Starting fedia..."
                        fedia
                        ;;
                    2)
                        echo "Starting script3.sh..."
                        bash script3.sh
                        ;;
                    3)
                        echo "Starting script4.sh..."
                        bash script4.sh
                        ;;
                    4)
                        echo "Starting script5.sh..."
                        bash script5.sh
                        ;;
                esac
                break  # Exit the loop
            else
                echo "Invalid script number!"
            fi
            ;;
        h)
            show_help
            ;;
        q)
            echo "Thank you for using the script!"
            break
            ;;
        *)
            echo "Invalid choice! Please choose again."
            ;;
    esac
done
