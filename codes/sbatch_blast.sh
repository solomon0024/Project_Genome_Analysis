### Synteny Comparision
##blastn
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J blastn_synteny_comparision
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=synteny.out

## Load modules
module load bioinfo-tools
module load blast

## blast commands
blastn -query /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon.fasta -subject /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/mummerplot/E_faecium_745_sequence.fasta -out /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/pilon_synteny/synteny_results.txt -outfmt 6
