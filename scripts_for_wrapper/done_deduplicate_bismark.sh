#!/bin/bash

# arg 1 - path to dir with samtools script
# arg 2 - path to input file (bismark .bam output)
# arg 3 - output dir
# arg 4 - full path to bismark deduplication script

path_to_st=$1
input_file=$2
output_dir=$3
path_to_bismark=$4

# create output dir
mkdir -p ${output_dir}

echo "Start deduplicate bismark"

${path_to_bismark} --samtools_path=${path_to_st} --paired --output_dir=${output_dir} ${input_file}

