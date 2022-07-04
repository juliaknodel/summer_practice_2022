# summer_practice_2022
__________________________
A program for processing paired-end bisulfite sequencing data

## Steps to be performed:
- fastp
- bismark
- deduplicate_bismark
- bismark_methylathion_extractor

## Structure Description:
1. All parameters are set in the wrapper_conf.conf file
2. Wrapping script wrapper.sh - executes scripts from the scripts_for_wrapper/ folder
3. wrapper.sh can accept 3 arguments (optional) as input:
    + The path to the output directory (the OUTPUT_DIR parameter from the configuration file will be replaced)
    + The path to the file with the \_1 reads (the SAMPLE_1_PATH parameter from the configuration file will be replaced)
    + The path to the file with the \_2 reads (the SAMPLE_2_PATH parameter from the configuration file will be replaced)
4. wrapper_sbatch.sbatch script - to run wrapper.sh via sbatch


## Examples
### Example of running without sbatch

- With arguments:
    > $ ./wrapper.sh path_to_output_dir sample_1.fq.gz sample_2.fq.gz

- Arguments can be omitted (values from the wrapper_conf.conf file will be taken):
    > $ ./wrapper.sh


### Example of running via sbatch

- With arguments
    > $ ./wrapper_sbatch.sbatch job_name path_to_output_dir sample_1.fq.gz sample_2.fq.gz

- No arguments (however, the first job-name argument is mandatory)
    > $ ./wrapper_sbatch.sbatch job_name

To run multiple jobs via sbatch, you can simply make calls (as in the example) from the loop, but be sure to give different job_name


## Output
Results will be stored in the specified output directory (OUTPUT_DIR), each step has its own folder:
- Output_dir/fastp_res – fastp output folder
- Output_dir/bismark_res – bismark output folder
- Output_dir/bismark_deduplication_res - deduplicate_bismark output folder
- Output_dir/bismark_methylation_extraction_res – bismark_methylation_extractor output folder
