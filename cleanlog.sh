#!/bin/bash

# Author: Mohammad Shadman

# It will clean the log directory in the system. 

cd /var/log
cat /dev/null > messages
cat /dev/null > wtmp
if [ $? == 0 ]
then echo "Done"
else echo "Permisson denied: Type 'sudo ./cleanlog.sh'"
fi

