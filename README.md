# hse21_H3K27me3_G4_human.

Цель работы - поиск и изучение участков генома, где
определенная гистоновая метка присутствует в местах образования вторичной структуры ДНК - квадруплекса - G4.

**Организм** - человек

**Гистоновая метка** - H3K27me3

**Тип клеток** - H9

**Результаты двух ChIP-seq экспериментов**: ENCFF851PCG и ENCFF680AKW


### Скачивание файлов и приведение к нужной версии генома (h19)

wget https://www.encodeproject.org/files/ENCFF851PCG/@@download/ENCFF851PCG.bed.gz
wget https://www.encodeproject.org/files/ENCFF680AKW/@@download/ENCFF680AKW.bed.gz

zcat ENCFF851PCG.bed.gz |  cut -f1-5 > H3K27me3_ENCFF851PCG.hg38.bed
zcat ENCFF680AKW.bed.gz|  cut -f1-5 > H3K27me3_ENCFF680AKW.hg38.bed

liftOver H3K27me3_ENCFF851PCG.hg38.bed hg38ToHg19.over.chain.gz H3K27me3_ENCFF851PCG.hg19.bed H3K27me3_ENCFF851PCG.hg19.unmapped.bed 

liftOver H3K27me3_ENCFF680AKW.hg38.bed hg38ToHg19.over.chain.gz H3K27me3_ENCFF680AKW.hg19.bed H3K27me3_ENCFF680AKW.hg19.unmapped.bed 


### **UCSC Genome Browser**: https://genome.ucsc.edu/s/tanshevelci/hse21_H3K27me3_G4_human_UCSC 

## Pie-chart: Location of Chip-seq peaks
### ENCFF680AKW (20460 peaks) and ENCFF851PCG (14794 peaks)
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.H3K27me3_H9.ENCFF680AKW.hg19filtered.plotAnnoPie.png)![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.H3K27me3_H9.ENCFF851PCG.hg19filtered.plotAnnoPie.png)

## Pie-chart: G4.bed (1285463 peaks)  ((DNA secondary structure))
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.G4_ALLLL.plotAnnoPie.png)

## Pie-chart: Intersect with G4 (46803 peaks)
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.!H3K27me3.intersect_with_G4.plotAnnoPie.png)
