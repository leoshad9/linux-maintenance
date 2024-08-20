#!/bin/bash

# Author: Mohammad Shadman

# It will update & clean the system.

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Starting system update and cleanup\n"

# Array of commands for update and cleanup
COMMANDS=(
    "sudo apt-get -y update"
    "sudo apt-get -y upgrade"
    "sudo apt-get -y dist-upgrade"
    "sudo apt-get -y autoremove"
    "sudo apt-get -y clean"
    "sudo apt-get -y autoclean"
)

# Execute each command and check for errors
for cmd in "${COMMANDS[@]}"; do
    echo "Running: $cmd"
    if $cmd; then
        echo "Completed: $cmd"
    else
        echo "Error: Command failed - $cmd"
        exit 1
    fi
done

echo -e "\n$(date "+%d-%m-%Y --- %T") --- System update and cleanup completed"
