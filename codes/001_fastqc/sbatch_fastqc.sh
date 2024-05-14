### Reads Quality Control
##FastQC
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J fastqc_reads_QC
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=FastQC_illumina.out

## Load modules
module load bioinfo-tools
module load FastQC

## fastqc commands
fastqc -o /home/solomon/Project_Genome_Analysis/analysis/01_reads_quality_control/fastqc /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz

fastqc -o /home/solomon/Project_Genome_Analysis/analysis/01_reads_quality_control/fastqc /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz
