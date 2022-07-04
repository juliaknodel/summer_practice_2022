#!/bin/bash

# arg 1 - path to dir with bowtie2 script
# arg 2 - path to dir with samtools script
# arg 3 - path to prepared genome folder (prepared with bismark)
# arg 4 - path to filtered file _1 with reads
# arg 5 - path to filtered file _2 with reads
# arg 6 - output dir
# arg 7 - full path to bismark script (include script name)

path_to_bt=$1
path_to_st=$2
path_to_bismark=$7
genome=$3
read1=$4
read2=$5
output_path=$6

# create output dir
mkdir -p ${output_path}

echo "Start bismark"

${path_to_bismark} --path_to_bowtie2=${path_to_bt} --samtools_path=${path_to_st} --genome ${genome} -1 ${read1} -2 ${read2} -o ${output_path}


