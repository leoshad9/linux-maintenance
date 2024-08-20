#!/bin/bash

# Author: Mohammad Shadman

# It will clean the log directory in the system. 

LOG_DIR="/var/log"
FILES=("messages" "wtmp")

# Navigate to the log directory
cd "$LOG_DIR" || { echo "Failed to access $LOG_DIR"; exit 1; }

# Clear the specified log files
for file in "${FILES[@]}"; do
    if sudo truncate -s 0 "$file"; then
        echo "$file cleared successfully."
    else
        echo "Failed to clear $file. Try running the script with sudo."
        exit 1
    fi
done

echo "Log files cleaned."
