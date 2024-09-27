#!/bin/bash

# Example:
# source test_run.sh util/tuner/RTX2080_S/dlt gpu-simulator/gpgpu-sim/configs/tested-cfgs/RTX2080_S RTX2080_S cuDGT test0

source_dir="$1"
target_dir="$2"
cfg="$3"
benchmark="$4"
prefix="$5"

cp "$target_dir/gpgpusim.config" "$target_dir/gpgpusim.original.config"
for filename in "$source_dir"/*.config; do
  id=${filename%.config}
  echo "Running ${id##*/}"
  cp "$filename" "$target_dir/gpgpusim.config"
  ./util/job_launching/run_simulations.py \
    -T ./hw_run/traces/device-0/11.6/ \
    -C "$cfg" -N "$prefix-$benchmark-${id##*/}" -B "$benchmark"
  sleep 3
done
mv "$target_dir/gpgpusim.original.config" "$target_dir/gpgpusim.config"