source('/Users/segodnyavottak/Documents/GitHub/hse21_H3K27me3_G4_human./src/libr.R')

NAME <- 'H3K27me3_H9.ENCFF680AKW.hg19'
#NAME <- 'H3K27me3_H9.ENCFF851PCG.hg19'


bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start




library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

ggplot(new) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(new))) +
  theme_bw()
ggsave(paste0('len_hist', NAME, '.init.pdf'), path = OUT_DIR)

new <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000) 

ggplot(new) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(new))) +
  theme_bw()
ggsave(paste0('len_hist', NAME, '.filtered.pdf'), path = OUT_DIR)



new %>%
  select(-len) %>%
  write.table(file=paste0(DATA_DIR, NAME, 'filtered.bed'),
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)


