#!/bin/bash

# First argument is text file
# Second argument is config prefix
# Example: source run_configs.sh GPUMB_configs.txt RTX2080_S
# Source accelsim first

while read -r arg
do
#  echo "$2${arg}" 
    ./util/job_launching/run_simulations.py \
    -T ./hw_run/traces/device-0/11.6/ \
    -C "$2${arg}" -N "tuning-$2${arg}" -B GPU_Microbenchmark
done < $1