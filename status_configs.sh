#!/bin/bash

# First argument is text file
# Second argument is config prefix
# Example: source status_configs.sh GPUMB_configs.txt RTX2080_S
# Source accelsim first

while read -r arg
do
#  echo "$2${arg}" 
    ./util/job_launching/job_status.py -N "tuning-$2${arg}"
done < $1 