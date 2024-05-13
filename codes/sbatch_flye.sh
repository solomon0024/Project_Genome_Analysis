### DNA assembly
##Flye
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J flye_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=flye.out

## Load modules
module load bioinfo-tools
module load Flye

## Flye command
--pacbio-raw /home/solomon/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio/m13102* --out-dir /home/solomon/Project_Genome_Analysis/analysis/03_DNA_assembly/flye --genome-size 3m --threads 2
