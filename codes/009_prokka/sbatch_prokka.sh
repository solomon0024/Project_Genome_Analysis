### Annotation
##Prokka
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J prokka_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=prokka.out

## Load modules
module load bioinfo-tools
module load prokka

## prokka commands
prokka --prefix efaecium_prokka --outdir /home/solomon/Project_Genome_Analysis/analysis/08_annotation/pilon_prokka --force /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon.fasta

