#!/bin/bash

# Example:
# source test_results.sh util/tuner/RTX2080_S/dlt cuDGT test0

source_dir="$1"
benchmark="$2"
prefix="$3"

for filename in "$source_dir"/*.config; do
  id=${filename%.config}
  echo "Getting results of ${id##*/}"
  ./util/job_launching/get_stats.py -R -k -K -N "$prefix-$benchmark-${id##*/}" | tee per.kernel.stats.csv
  ./util/plotting/plot-correlation.py -c per.kernel.stats.csv -H ./hw_run/device-0/11.6/ -O "$prefix-$benchmark/${id##*/}"
done