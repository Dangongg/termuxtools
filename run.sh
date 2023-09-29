#!/bin/bash

#Ansi colours
purple="\e[35m"
blue="\e[34m"
green="\e[32m"
yellow="\e[33m"
orange="\e[38;5;208m"
red="\e[31m"
#Ansi default
reset="\e[0m"

sms_spam() {
    clear
    echo " "
    echo -e "{$purple} _             _     ____  _____ _____   _     {$reset}"
    echo -e "{$blue}| |_ ___ ___ _| |_ _|    \|  _  |   | |_| |_ _ {$reset}"
    echo -e "{$green}|   | .'|   | . | | |  |  |     | | | | . | | | {$reset}"
    echo -e "{$yellow}|_|_|__,|_|_|___|_  |____/|__|__|_|___|___|_  | {$reset}"
    echo -e "{$orange}                |___|                     |___| {$reset}"
    echo ==============================================================
    echo {$red}sms-spam loaded!{$reset}
    echo ==============================================================
    read -p "Type targets phone number(with '+' and no spaces): " number
    echo target number : {$number} if this is wrong press CTRL + c
    read -p "Which SIM card will you be using? (If you only have 1, type 1) : " sim
    echo SIM slot : {$sim} if this is wrong press CTRL + c
    read -p "What do you want the message to be? : " msg
    echo message set to : {$msg} if this is wrong type CTRL + C
    read -p "How many times do you want to send this message? MAX_100 : " repeats
    echo repeats set to : {$repeats} if it is over MAX it will stop at MAX

    #checks if repeats is > 100
    if [ "$repeats" -gt 100 ]; then
        repeats=100
    fi
    echo -e "{$red} Remember the target will be able see your SIM card's number{$reset}"
    read -p "Type 1 to execute or anything else to cancel : " confirm
    #checks if they confirmed
    if [ "$confirm" -eq "1" ]; then
        echo "Executing..."
    else
        exit
    fi

    for ((i = 1; i <= repeats; i++)); do
        termux-sms-send -n $number -s $sim "$message"
        sleep 0.5
    done
    echo -e "{$green}Completed!{$reset}"
    echo "Returning to menu in 5 seconds, CTRL + c to exit application"
    sleep 5
    clear
    sms_spam()
}

torch_spam() {
    clear
    echo " "
    echo -e "{$purple} _             _     ____  _____ _____   _     {$reset}"
    echo -e "{$blue}| |_ ___ ___ _| |_ _|    \|  _  |   | |_| |_ _ {$reset}"
    echo -e "{$green}|   | .'|   | . | | |  |  |     | | | | . | | | {$reset}"
    echo -e "{$yellow}|_|_|__,|_|_|___|_  |____/|__|__|_|___|___|_  | {$reset}"
    echo -e "{$orange}                |___|                     |___| {$reset}"
    echo ==============================================================
    echo {$red}torch-spam loaded!{$reset}
    echo ==============================================================
    read -p "How many times do you want to spam? MAX_25 : " lightflashes
    echo "Repeats set to : {$lightflashes}"
    #checks if flashes > 25
    if ["$lightflashes" -gt 25 ]; then
        lightflashes=25
    fi

    echo -e "{$red} Remember this will be bright{$reset}"
    read -p "Type 1 to execute or anything else to cancel : " confirm2
    #checks if they confirmed
    if [ "$confirm2" -eq "1" ]; then
        echo "Executing..."
    else
        exit
    fi

    for ((i = 1; i <= lightflashes; i++)); do
        termux-torch on
        sleep 0.15
        termux-torch off
        sleep 0.15
    done

    echo -e "{$green}Completed!{$reset}"
    echo "Returning to menu in 5 seconds, CTRL + c to exit application"
    sleep 5
    clear
    torch_spam()
}


main_menu() {
    clear
    echo " "
    echo -e "{$purple} _             _     ____  _____ _____   _     {$reset}"
    echo -e "{$blue}| |_ ___ ___ _| |_ _|    \|  _  |   | |_| |_ _ {$reset}"
    echo -e "{$green}|   | .'|   | . | | |  |  |     | | | | . | | | {$reset}"
    echo -e "{$yellow}|_|_|__,|_|_|___|_  |____/|__|__|_|___|___|_  | {$reset}"
    echo -e "{$orange}                |___|                     |___| {$reset}"
    echo ==============================================================
    echo {$red}handyDANdy loaded!{$reset}
    echo Please select one of the options:
    echo "(requires TermuxAPI)"
    echo "[1] sms-spam"
    echo "[2] torch-spam"
    echo "[3] exit"
    echo ==============================================================
    read -p "Select an option: " option

    case "$option" in
        1)
            echo "You selected sms-spam."
            # Add your sms-spam code here
            clear
            sms_spam();
            ;;
        2)
            echo "You selected torch-spam."
            # Add your torch-spam code here
            clear
            torch_spam();
            ;;
        3)
            echo "Exiting..."
            exit  # Exit the script
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            clear
            main_menu();
            ;;
    esac
}

main_menu()