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
bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797969_pass_2.fastq.gz > alignment_RNA_seq_paired_69.sam

bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797970_pass_2.fastq.gz > alignment_RNA_seq_paired_70.sam

bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797971_pass_2.fastq.gz > alignment_RNA_seq_paired_71.sam

bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797972_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797972_pass_2.fastq.gz > alignment_RNA_seq_BH_72.sam

bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797973_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797973_pass_2.fastq.gz > alignment_RNA_seq_BH_73.sam

bwa mem /home/solomon/Project_Genome_Analysis/analysis/analysis/04_assembly_polishing/pilon.fasta /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_Serum/trim_paired_ERR1797974_pass_1.fastq.gz /home/solomon/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH/trim_paired_ERR1797974_pass_2.fastq.gz > alignment_RNA_seq_BH_74.sam

## Convert SAM to BAM
samtools view -b -o alignment_RNA_seq_paired_69.bam alignment_RNA_seq_paired_69.sam

samtools view -b -o alignment_RNA_seq_paired_70.bam alignment_RNA_seq_paired_70.sam

samtools view -b -o alignment_RNA_seq_paired_71.bam alignment_RNA_seq_paired_71.sam

samtools view -b -o alignment_RNA_seq_BH_72.bam alignment_RNA_seq_BH_72.sam

samtools view -b -o alignment_RNA_seq_BH_73.bam alignment_RNA_seq_BH_73.sam

samtools view -b -o alignment_RNA_seq_BH_74.bam alignment_RNA_seq_BH_74.sam

## Sort the BAM file
samtools sort -o alignment_RNA_seq_paired_69_sorted.bam alignment_RNA_seq_paired_69.bam

samtools sort -o alignment_RNA_seq_paired_70_sorted.bam alignment_RNA_seq_paired_70.bam

samtools sort -o alignment_RNA_seq_paired_71_sorted.bam alignment_RNA_seq_paired_71.bam

samtools sort -o alignment_RNA_seq_BH_72_sorted.bam alignment_RNA_seq_BH_72_sorted.sam

samtools sort -o alignment_RNA_seq_BH_73_sorted.bam alignment_RNA_seq_BH_73_sorted.sam

samtools sort -o alignment_RNA_seq_BH_74_sorted.bam alignment_RNA_seq_BH_74_sorted.sam



