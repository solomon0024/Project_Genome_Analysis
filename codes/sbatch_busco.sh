### assembly evaluation
##BUSCO
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J BUSCO_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=BUSCO.out

## Load modules
module load bioinfo-tools
module load BUSCO

## busco command
busco -i /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/alignment_illumina_sorted.fasta -l /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/odb/lactobacillales_odb10 -o /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/bwa_busco -m genome -f
