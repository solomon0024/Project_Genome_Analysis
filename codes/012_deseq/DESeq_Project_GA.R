htseqcounts <- as.matrix(read.table("C:/Users/solom/Desktop/GenomeAnalysis/counts.txt", header=TRUE, row.names=1))

colnames(htseqcounts)<- c("RNA_seq_BH1", "RNA_seq_BH2", "RNA_seq_BH3", "RNA_seq_serum1", "RNA_seq_serum2", "RNA_seq_serum3")

metadata <- as.matrix(read.table("C:/Users/solom/Desktop/GenomeAnalysis/metadata.txt"))
colnames(metadata)<- c("", "treatment")
rownames(metadata) <- c("RNA_seq_BH1", "RNA_seq_BH2", "RNA_seq_BH3", "RNA_seq_serum1", "RNA_seq_serum2", "RNA_seq_serum3")

library(DESeq2)

dds <- DESeqDataSetFromMatrix(countData = htseqcounts,
                              colData = metadata,
                              design = ~ treatment)

dds <- DESeq(dds)

res <- results(dds)
plotMA( res, ylim = c(-1, 1) )

significant_genes4 <- subset(res, padj < 0.0001 & (log2FoldChange > 1 | log2FoldChange < -1))

summary(significant_genes4)

# Filter genes with absolute fold change greater than the threshold
absFoldChangeThreshold <- 2 # Set your desired absolute fold change threshold here

# Filter genes with absolute fold change greater than the threshold
significant_genes4Abs <- significant_genes4[abs(significant_genes4$log2FoldChange) > log2(absFoldChangeThreshold), ]

# Sort by absolute fold change and then by p-value (padj)
significant_genes4Abs_sorted <- significant_genes4Abs[order(abs(significant_genes4Abs$log2FoldChange), significant_genes4Abs$padj), ]

# Assuming significant_genes4Abs_sorted contains your differential expression results sorted by absolute fold change

# Subset genes by upregulated and downregulated
upregulated_genes <- significant_genes4Abs_sorted[significant_genes4Abs_sorted$log2FoldChange > 0, ]
downregulated_genes <- significant_genes4Abs_sorted[significant_genes4Abs_sorted$log2FoldChange < 0, ]

# Order genes by absolute fold change
upregulated_genes_sorted <- upregulated_genes[order(-upregulated_genes$log2FoldChange), ]
downregulated_genes_sorted <- downregulated_genes[order(downregulated_genes$log2FoldChange), ]

# Select top 10 upregulated and downregulated genes
top_10_upregulated <- head(upregulated_genes_sorted, 10)
top_10_downregulated <- head(downregulated_genes_sorted, 10)

# Display top 10 upregulated and downregulated genes
print("Top 10 Upregulated Genes:")
print(top_10_upregulated)
print("Top 10 Downregulated Genes:")
print(top_10_downregulated)

normalized_counts <- counts(dds, normalized=TRUE)
# Viewing the top genes
top_genes <- head(upregulated_genes_sorted, n=10)
heatmap_genes <- normalized_counts[rownames(top_genes), ]
dim(heatmap_genes)

library(ggplot2)
library(pheatmap)
pheatmap(log2(heatmap_genes + 1), clustering_distance_rows = "euclidean", clustering_distance_cols = "euclidean", scale = "row")