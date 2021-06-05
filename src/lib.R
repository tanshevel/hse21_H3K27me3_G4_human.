library(ggplot2)
library(dplyr)
library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

NAME <- 'H3K27me3_H9.ENCFF680AKW.hg19'
#NAME <- 'H3K27me3_H9.ENCFF680AKW.hg38'
#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg19'
#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg38'
OUT_DIR <- '/Users/segodnyavottak/Desktop/proekt'
bed_df <- read.delim(paste0('/Users/segodnyavottak/Desktop/proekt/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)
hist(bed_df$len)
ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)

library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

bed_df %>%
  arrange(-len) %>%
  nrow()

bed_df <- read.delim(paste0('/Users/segodnyavottak/Desktop/proekt/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

new <- bed_df %>%
  arrange(-len) %>%
  filter(len < 20000) 

ggplot(new) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(new))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.filtered.pdf'), path = OUT_DIR)



new %>%
  select(-len) %>%
  write.table(file='/Users/segodnyavottak/Desktop/proekt/H3K4me3_A549.ENCFF680AKW.hg19.filtered.bed',
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)


