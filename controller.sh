#!/bin/bash

# backup error handler
set -e

function banner() {
    clear
    echo "                                                                                      "
    echo -e "\e[1;31m    ██████╗ ██████╗  ██████╗      ██╗       ███████╗██╗███████╗██████╗ ██████╗  █████╗  \e[1;0m"
    echo -e "\e[1;31m    ██╔══██╗██╔══██╗██╔═══██╗     ██║       ██╔════╝██║██╔════╝██╔══██╗██╔══██╗██╔══██╗ \e[1;0m"
    echo -e "\e[1;31m    ██████╔╝██████╔╝██║   ██║     ██║       ███████╗██║█████╗  ██████╔╝██████╔╝███████║ \e[1;0m"
    echo -e "\e[1;31m    ██╔═══╝ ██╔══██╗██║   ██║██   ██║       ╚════██║██║██╔══╝  ██╔══██╗██╔══██╗██╔══██║ \e[1;0m"
    echo -e "\e[1;31m    ██║     ██║  ██║╚██████╔╝╚█████╔╝██╗    ███████║██║███████╗██║  ██║██║  ██║██║  ██║ \e[1;0m"
    echo -e "\e[1;31m    ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝    ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ \e[1;0m"
    echo ""
    echo -e "\n   *Please Note: This is a beta version of the script. It is still under development.    "
    echo ""

    echo -e "
    +----------------------------------+--------------+------------------------------+
    |            \e[1;34mCommand\e[1;0m               |   \e[1;34mShortCut\e[1;0m   |          \e[1;34m Description\e[1;0m        |
    +----------------------------------+--------------+------------------------------+
    | \e[1;32m           Update \e[1;0m               |     \e[1;35m  u \e[1;0m     | \e[1;36m    Update the GitHub Code\e[1;0m   |
    | \e[1;32m           Start  \e[1;0m               |     \e[1;35m  s \e[1;0m     | \e[1;36m     Start the Project\e[1;0m       |
    | \e[1;32m          Restart    \e[1;0m            |     \e[1;35m  r \e[1;0m     | \e[1;36m     Restart the Project \e[1;0m    |
    | \e[1;32m          Monitor    \e[1;0m            |     \e[1;35m  m \e[1;0m     | \e[1;36m    Open Project Monitor \e[1;0m    |
    | \e[1;32m           Quit    \e[1;0m              |     \e[1;35m  q \e[1;0m     | \e[1;36m       Exit the menu   \e[1;0m      |
    +----------------------------------+--------------+------------------------------+
    "
}

function update() {
    echo -e "\e[1;32mUpdating the GitHub Code\e[1;0m"
    {
        git pull
        git add .
        git commit -m "Update"
        git push
        echo -e "\e[1;32mUpdate Complete\e[1;0m"
    } || {
        echo -e "\e[1;31mError: Please make sure you have installed the dependencies\e[1;0m"

        exit -1
    }
}

function start() {
    echo -e "\e[1;32mStarting the Project\e[1;0m"
    { 
        clear && npm start
        
        echo -e "\e[1;32mProject Started\e[1;0m"
    } || {
        clear && npm build && npm start

        echo -e "\e[1;32mProject Started\e[1;0m"
    }
}

function restart() {
    echo -e "\e[1;32mRestarting the Project\e[1;0m"
    { # Try
        clear && npm restart
        
        echo -e "\e[1;32mProject Restarted\e[1;0m"
    } || {
        echo -e "\e[1;31mError: Please make sure you have installed the dependencies\e[1;0m"

        exit -1
    }
}

function monitor() {
    echo -e "\e[1;32mMonitoring the Project\e[1;0m"
    { # Try
        clear && npx pm2 monit
    } || {
        echo -e "\e[1;31mError: Please make sure you have installed the dependencies\e[1;0m"

        exit -1
    }
}

function main() {
    banner

    read -p "Enter command choice: " choice

    while [ "$choice" != "q" ]
    do
        case $choice in
            u|update) update ;;
            s|start) start ;;
            r|restart) restart ;;
            m|monitor) monitor ;;
            q|quit) exit 0 ;;
            *) echo -e "\e[1;31mInvalid option\e[1;0m" ;;
        esac
        banner
        read -p "Enter command choice: " choice
    done
}

main