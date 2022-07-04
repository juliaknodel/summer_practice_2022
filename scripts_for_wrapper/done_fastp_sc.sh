#!/bin/bash
# 1 arg - _1 .fq.gz
# 2 arg - _2 .fq.gz
# 3 arg - output_dir full path
# 4 arg - fastp script full path
# 5 arg - file 1 output name
# 6 arg - file 2 output name

file_in_1=$1
file_in_2=$2

output_path=$3

fastp_path=$4

# create output dir
mkdir -p ${output_path}

file_out_1="${output_path}/${5}"
file_out_2="${output_path}/${6}"

file_html="${output_path}/fastp_report.html"
file_json="${output_path}/fastp_report.json"

echo "Start fastp"

${fastp_path} -i ${file_in_1} -I ${file_in_2} -o ${file_out_1} -O ${file_out_2} -h ${file_html} -j ${file_json}

