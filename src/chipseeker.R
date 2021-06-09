source('/Users/segodnyavottak/Documents/GitHub/hse21_H3K27me3_G4_human./src/libr.R')
install.packages("installr")
library(installr)
updateR()
###


require(AnnotationDbi)
if (!requireNamespace("BiocManager", quietly = TRUE)){
  install.packages("BiocManager")
}
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene", force = TRUE)

BiocManager::install('clusterProfiler', force = TRUE)
BiocManager::install('ChIPseeker', force = TRUE)

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)

###

#NAME <- '!H3K27me3.intersect_with_G4'
#NAME <- 'G4_ALLLL'
#NAME <- 'H3K27me3_H9.ENCFF680AKW.hg19filtered'
#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg19filtered'

BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###
BiocManager::install("org.Hs.eg.db", force = TRUE)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 