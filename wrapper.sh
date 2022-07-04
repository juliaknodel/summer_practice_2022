#!/bin/bash

source wrapper_conf.conf

basename_1="sample_1_out"
basename_2="sample_2_out"
fastp_out_filename_1="${basename_1}.fq.gz"
fastp_out_filename_2="${basename_2}.fq.gz"


# change input filenames and output directory if there was additional arguments
if [ -n "$1" ]
then
OUTPUT_DIR=$1
fi

if [ -n "$2" ]
then
SAMPLE_1_PATH=$2
fi

if [ -n "$3" ]
then
SAMPLE_2_PATH=$3
fi

# --------------------------------------
# STEP 1: FASTP
# --------------------------------------


scripts_for_wrapper/done_fastp_sc.sh $SAMPLE_1_PATH $SAMPLE_2_PATH "${OUTPUT_DIR}/fastp_res" $PATH_TO_FASTP $fastp_out_filename_1 $fastp_out_filename_2


# --------------------------------------
# STEP 2: BISMARK
# --------------------------------------


fastp_out_path_1="${OUTPUT_DIR}/fastp_res/${fastp_out_filename_1}"
fastp_out_path_2="${OUTPUT_DIR}/fastp_res/${fastp_out_filename_2}"

scripts_for_wrapper/done_bismark.sh $PATH_TO_BOWTIE $PATH_TO_SAMTOOLS $PREPARED_GENOME_FOLDER $fastp_out_path_1 $fastp_out_path_2 "${OUTPUT_DIR}/bismark_res" $PATH_TO_BISMARK


# --------------------------------------
# STEP 3: DEDUPLICATE_BISMARK
# --------------------------------------


# first sample filename + _bismark_bt2_pe.bam for PE
input_bam="${OUTPUT_DIR}/bismark_res/${basename_1}_bismark_bt2_pe.bam"

scripts_for_wrapper/done_deduplicate_bismark.sh $PATH_TO_SAMTOOLS $input_bam "${OUTPUT_DIR}/bismark_deduplication_res" $PATH_TO_DEDUPLICATE_BISMARK


# --------------------------------------
# STEP 4: BISMARK_METHYLATION_EXTRACTION
# --------------------------------------


# same as .bam name but add .deduplicated in ext.
input_deduplicated="${OUTPUT_DIR}/bismark_deduplication_res/${basename_1}_bismark_bt2_pe.deduplicated.bam"

scripts_for_wrapper/done_bismark_methylation_extractor.sh $PATH_TO_SAMTOOLS $PREPARED_GENOME_FOLDER $input_deduplicated "${OUTPUT_DIR}/bismark_methylation_extraction_res" $PATH_TO_BISMARK_METHYLATION_EXTRACTOR


