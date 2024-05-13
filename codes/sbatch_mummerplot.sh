### Assembly Evaluation 3
##mummerplot
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J mummerplot_assembly_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=mummerplot.out

## Load modules
module load bioinfo-tools
module load MUMmer

## mummerplot commands
##Align using nucmer
nucmer /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/mummerplot/E_faecium_745_sequence.fasta /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon.fasta -p /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/pilon_mummerplot/nucmer_efaecium_output

## mummerplot commands
mummerplot -p /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/pilon_mummerplot/mummerplot --png /home/solomon/Project_Genome_Analysis/analysis/05_assembly_evaluation/pilon_mummerplot/nucmer_efaecium_output.delta
