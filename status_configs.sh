#!/bin/bash

# First argument is text file
# Second argument is prefix
# Example: source status.sh GPUMB_configs.txt RTX2070_S
# Source accelsim first

while read -r arg
do
#  echo "$2${arg}" 
    ./util/job_launching/job_status.py -N "tuning${arg}"
done < $1 