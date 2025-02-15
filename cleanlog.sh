#!/bin/bash

# Author: Mohammad Shadman

set -euo pipefail  # Enable strict error handling

LOG_DIR="/var/log"
LOG_FILE="/var/log/clear_log_file.log"  # Log file for tracking
FILES=("messages" "wtmp")

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Function to clear log files
clear_log_file() {
    local file="$1"
    if sudo truncate -s 0 "$file"; then
        log_message "$file cleared successfully."
    else
        log_message "Error: Failed to clear $file. Try running the script with sudo."
        exit 1
    fi
}

# Check for sudo privileges
if [[ "$EUID" -ne 0 ]]; then
    echo "Error: This script must be run as root. Exiting." >&2
    exit 1
fi

# Navigate to the log directory
if cd "$LOG_DIR"; then
    for file in "${FILES[@]}"; do
        clear_log_file "$file"
    done
    log_message "All specified log files have been cleaned."
else
    log_message "Error: Failed to access $LOG_DIR. Exiting."
    exit 1
fi
