#!/bin/bash

# First argument is text file
# Second argument is prefix
# Example: source status.sh GPUMB_configs.txt RTX2070_S
# Source accelsim first

while read -r arg
do
#  echo "$2${arg}" 
    # ./util/job_launching/job_status.py -N "tuning${arg}"
    ./util/job_launching/get_stats.py -R -k -K -B GPU_Microbenchmark -C "$2${arg}"  | tee "tuning${arg}.per.kernel.stats.csv"
    ./util/plotting/plot-correlation.py -c "tuning${arg}.per.kernel.stats.csv" -H ./hw_run/device-0/11.6/ -v -e
done < $1 