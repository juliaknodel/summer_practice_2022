#!/bin/bash


# run via: '$ ./wrapper.sbatch arg1 arg2 arg3 arg4"

# arg1 - job-name (mandatory)
# arg2 - output_dir
# arg3 - input sample file 1
# arg4 - input sample file 2

sbatch --job-name=$1 --nodes=1 --time=1-0 --output="${1}_res.txt" ./wrapper.sh $2 $3 $4


