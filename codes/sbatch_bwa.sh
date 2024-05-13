### Mapping Reads
##BWA
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J bwa_illumina_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=bwa_illumina.out

## Load modules
module load bioinfo-tools
module load bwa
module load samtools

## BWA commands
bwa index /home/solomon/Project_Genome_Analysis/analysis/03_DNA_assembly/flye/assembly.fasta

bwa mem /home/solomon/Project_Genome_Analysis/analysis/03_DNA_assembly/flye/assembly.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E74*.fq.gz > alignment_illumina.sam

#To view BWA output statistics
module load bioinfo-tools samtools
samtools flagstat alignment_illumina.bam
