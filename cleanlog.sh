#!/bin/bash

# Author: Mohammad Shadman
# Description: Cleans specific log files in the /var/log directory.

set -euo pipefail  # Enable strict error handling

LOG_DIR="/var/log"
FILES=("messages" "wtmp")

# Function to clear log files
clear_log_file() {
    local file="$1"
    if sudo truncate -s 0 "$file"; then
        echo "$file cleared successfully."
    else
        echo "Error: Failed to clear $file. Try running the script with sudo." >&2
        exit 1
    fi
}

# Navigate to the log directory
if cd "$LOG_DIR"; then
    for file in "${FILES[@]}"; do
        clear_log_file "$file"
    done
    echo "All specified log files have been cleaned."
else
    echo "Error: Failed to access $LOG_DIR. Exiting." >&2
    exit 1
fi
