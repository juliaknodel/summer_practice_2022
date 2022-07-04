#!/bin/bash

# num -  variety; num1 - replicate; num2 - 1 and 2 bc of paired reads
for num in "1" "2" "3"
do
	for num1 in "1" "2" "3"
	do
		src_folder="/mnt/projects/akanapin/BSSeq/chickpea/fastq/n${num}_${num1}"
		tgt_folder="/home/yuknodel/data/n${num}_${num1}"

		mkdir ${tgt_folder}
		for num2 in "1" "2"
		do
			echo "${num}_${num1}_${num2}"
			file_mask="${src_folder}/*_${num2}.fq.gz"
			new_file="${tgt_folder}/n${num}_${num1}_${num2}.fq.gz"

			#echo ${file_mask}
			#echo ${new_file}
			cat ${file_mask} > ${new_file}
		done
	done
done
