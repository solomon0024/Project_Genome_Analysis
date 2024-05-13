### DNA assembly
##spades
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J spades_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=spades.out

## Load modules
module load bioinfo-tools
module load spades

## spades command
spades.py --pe-1 /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/ E745-1.L500_SZAXPI015146-56_1_clean.fq.gz --pe-2 /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/ E745-1.L500_SZAXPI015146-56_2_clean.fq.gz --trusted-contigs /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon.fasta --nanopore /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/Nanopore/E745_all.fasta.gz -o /home/solomon/Project_Genome_Analysis/analysis/06_DNA_assembly2/spades
