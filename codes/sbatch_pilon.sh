### Assembly Evaluation
##Pilon
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J pilon_assembly_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=pilon.out

## Load modules
module load bioinfo-tools
module load samtools
module load Pilon
module load bcftools

## In order to run the pilon commnd we need to
## Convert SAM to BAM
samtools view -b -o alignment_illumina.bam alignment_illumina.sam

## Sort the BAM file
samtools sort -o alignment_illumina_sorted.bam alignment_illumina.bam

## Index the sorted BAM file
samtools index /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon/alignment_illumina_sorted.bam

## Pilon command
java -jar $PILON_HOME/pilon.jar --genome /home/solomon/Project_Genome_Analysis/analysis/03_DNA_assembly/flye/assembly.fasta --frags /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon/alignment_illumina_sorted.bam --changes --vcf --output /home/solomon/Project_Genome_Analysis/analysis/04_assembly_polishing/pilon

#To view statistics from pilon
bcftools stats pilon.vcf > pilon_stats.txt
less pilon_stats.txt
