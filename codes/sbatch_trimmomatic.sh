### Reads Preprocessing
##Trimmomatic
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J trimmomatics_reads_preprocessing
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=trimmomatic.out

## Load modules
module load bioinfo-tools
module load trimmomatic

## trimmomatic command
java -jar $TRIMMOMATIC_ROOT/trimmomatic.jar PE -threads 2 /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz /home/solomon/Project_Genome_Analysis/analysis/02_reads_preprocessing/trimmomatic/E745-1.L500_SZAXPI015146-56_1_clean_paired.fq.gz /home/solomon/Project_Genome_Analysis/analysis/02_reads_preprocessing/trimmomatic/E745-1.L500_SZAXPI015146-56_1_clean_unpaired.fq.gz /home/solomon/Project_Genome_Analysis/analysis/02_reads_preprocessing/trimmomatic/E745-1.L500_SZAXPI015146-56_2_clean_paired.fq.gz /home/solomon/Project_Genome_Analysis/analysis/02_reads_preprocessing/trimmomatic/E745-1.L500_SZAXPI015146-56_2_clean_unpaired.fq.gz TRAILING:28 MINLEN:75
