#!/bin/bash

# Author: Mohammad Shadman

set -euo pipefail  # Enable strict error handling

COMMANDS=(
    "sudo apt-get -y update"
    "sudo apt-get -y upgrade"
    "sudo apt-get -y dist-upgrade"
    "sudo apt-get -y autoremove"
    "sudo apt-get -y clean"
    "sudo apt-get -y autoclean"
)

log_file="/var/log/sysmaintain.log"

# Function to run commands and log output
run_command() {
    local cmd="$1"
    echo "Running: $cmd" | tee -a "$log_file"
    if $cmd >>"$log_file" 2>&1; then
        echo "Completed: $cmd" | tee -a "$log_file"
    else
        echo "Error: Command failed - $cmd" >&2
        exit 1
    fi
}

echo -e "\n$(date "+%d-%m-%Y --- %T") --- Starting system update and cleanup\n" | tee -a "$log_file"

# Execute and log each command
for cmd in "${COMMANDS[@]}"; do
    run_command "$cmd"
done

echo -e "\n$(date "+%d-%m-%Y --- %T") --- System update and cleanup completed\n" | tee -a "$log_file"
