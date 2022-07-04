#!/bin/bash

# arg 1 - path to dir with samtools script
# arg 2 - path to folder with genome (prepared by bismark)
# arg 3 - path to deduplicated sample
# arg 4 - output dir name
# arg 5 - full path to bismark methylation extractor script

path_to_st=$1
genome=$2
sample=$3
output_dir=$4
bismark_met_extr=$5

# create output dir
mkdir -p ${output_dir}

echo "Start Bismark methylation extraction"

${bismark_met_extr} --samtools_path=${path_to_st} --gzip --bedGraph --cytosine_report --genome_folder ${genome} -o ${output_dir} ${sample}
