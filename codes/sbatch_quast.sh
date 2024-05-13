### Assembly Evaluation 2
##QUAST
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J quast_assembly_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=quast.out

## Load modules
module load bioinfo-tools
module load quast

## quast commands
quast.py /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon.fasta -o /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/pilon_quast
