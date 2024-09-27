#!/bin/bash

# Example:
# source test_status.sh util/tuner/RTX2080_S/dlt cuDGT test0

source_dir="$1"
benchmark="$2"
prefix="$3"

for filename in "$source_dir"/*.config; do
  id=${filename%.config}
  echo "Status of ${id##*/}"
  ./util/job_launching/job_status.py -N "$prefix-$benchmark-${id##*/}"
done