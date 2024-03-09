#!/bin/bash

# First argument is text file
# Second argument is prefix
# Example: source run_configs.sh GPUMB_configs.txt RTX2070_S
# Source accelsim first

while read -r arg
do
#  echo "$2${arg}" 
    ./util/job_launching/run_simulations.py \
    -T ./hw_run/traces/device-0/11.6/ \
    -C "$2${arg}" -N "tuning${arg}" -B GPU_Microbenchmark
done < $1 

# -LINEAR-RR-32B-FRFCFS
# -LINEAR-RR-32B-FCFS
# -LINEAR-RR-256B-FRFCFS
# -LINEAR-RR-256B-FCFS
# -LINEAR-GTO-32B-FRFCFS
# -LINEAR-GTO-32B-FCFS
# -LINEAR-GTO-256B-FRFCFS
# -LINEAR-GTO-256B-FCFS
# -IPOLY-RR-32B-FRFCFS
# -IPOLY-RR-32B-FCFS
# -IPOLY-RR-256B-FRFCFS
# -IPOLY-RR-256B-FCFS
# -IPOLY-GTO-32B-FRFCFS
# -IPOLY-GTO-32B-FCFS
# -IPOLY-GTO-256B-FRFCFS
# -IPOLY-GTO-256B-FCFS