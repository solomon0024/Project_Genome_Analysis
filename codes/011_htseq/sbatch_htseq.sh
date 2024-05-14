### Reads Counting
##htseq
#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J htseq_reads_counting
#SBATCH --mail-type=ALL
#SBATCH --mail-user solomon_asnake@yahoo.com
#SBATCH --output=htseq_counting.out

## Load modules
module load bioinfo-tools
module load htseq

##GFF should not have the contig sequences in it
sed '/^##FASTA/Q' efaecium_prokka.gff > efaecium_prokka_nosequence.gff

## htseq commands
htseq-count -f bam -r pos -s no -i ID -t CDS /home/solomon/Project_Genome_Analysis/analysis/09_mapping/bwa_RNA_seq/*.bam /home/solomon/Project_Genome_Analysis/analysis/09_mapping/bwa_RNA_seq/efaecium_prokka_nosequence.gff  > counts.txt
