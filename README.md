# hse21_H3K27me3_G4_human.

### **UCSC Genome Browser**: https://genome.ucsc.edu/s/tanshevelci/hse21_H3K27me3_G4_human_UCSC 

Цель работы - поиск и изучение участков генома, где
определенная гистоновая метка присутствует в местах образования вторичной структуры ДНК - квадруплекса - G4.

**Организм** - человек

**Гистоновая метка** - H3K27me3

**Тип клеток** - H9

**Результаты двух ChIP-seq экспериментов**: ENCFF851PCG и ENCFF680AKW


## Скачивание файлов и приведение к нужной версии генома (h19)

wget https://www.encodeproject.org/files/ENCFF851PCG/@@download/ENCFF851PCG.bed.gz

wget https://www.encodeproject.org/files/ENCFF680AKW/@@download/ENCFF680AKW.bed.gz

zcat ENCFF851PCG.bed.gz |  cut -f1-5 > H3K27me3_ENCFF851PCG.hg38.bed

zcat ENCFF680AKW.bed.gz|  cut -f1-5 > H3K27me3_ENCFF680AKW.hg38.bed

wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz


**liftOver** H3K27me3_ENCFF851PCG.hg38.bed hg38ToHg19.over.chain.gz H3K27me3_ENCFF851PCG.hg19.bed H3K27me3_ENCFF851PCG.hg19.unmapped.bed 

**liftOver** H3K27me3_ENCFF680AKW.hg38.bed hg38ToHg19.over.chain.gz H3K27me3_ENCFF680AKW.hg19.bed H3K27me3_ENCFF680AKW.hg19.unmapped.bed 

## Построение гистограмм длин участков для всех файлов

(см файл lib.r в папке src)

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF851PCG.hg38 

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/original_len_histH3K27me3_H9.ENCFF851PCG.hg38.pdf)

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF851PCG.hg19

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/my_len_hist.H3K27me3_H9.ENCFF851PCG.hg38.png)

Осуществляем фильтрацию. Сначала ольтфильтровала участки длиной до 20000, но потом при рассмотрении решила отфильтровать также до 10000, так как увидела еще единичные участки с такой длиной.

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF851PCG.hg19 после фильтрации

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/filtr_len_hist.H3K27me3_H9.ENCFF851PCG.hg19.filtered.pdf)

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF680AKW.hg38

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/my_len_hist.H3K27me3_H9.ENCFF680AKW.hg38.png)

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF680AKW.hg19

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/my_len_hist.H3K27me3_H9.ENCFF680AKW.hg19.png)

Осуществляем фильтрацию. Сначала ольтфильтровала участки длиной до 20000, но потом при рассмотрении решила отфильтровать также до 5000, так как увидела еще единичные участки с такой длиной.

### Гистограмма распределения длин участков H3K27me3_H9.ENCFF680AKW.hg19 после фильтрации

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/filtr_len_hist.H3K27me3_H9.ENCFF680AKW.hg19.filtered.pdf)

Файлы полученные после фильтрации находятся в папке data (файлы с описанием filter_peaks R was added)

## Pie-chart: Location of Chip-seq peaks

(см файл cheepseeker.r в папке src)

### ENCFF680AKW (20460 peaks) and ENCFF851PCG (14794 peaks)
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.H3K27me3_H9.ENCFF680AKW.hg19filtered.plotAnnoPie.png)![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.H3K27me3_H9.ENCFF851PCG.hg19filtered.plotAnnoPie.png)

## Pie-chart: G4.bed (1285463 peaks)  ((DNA secondary structure))
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.G4_ALLLL.plotAnnoPie.png)

## Pie-chart: Intersect with G4 (46803 peaks)
![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/chip_seeker.!H3K27me3.intersect_with_G4.plotAnnoPie.png)

Объединение наборов ChIP-seq пиков

cat  *.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K27me3_ENCF.merge.hg19.bed 


После этого данные были визуализированны в UCSC Genome Browser

![Alt text](https://github.com/tanshevel/hse21_H3K27me3_G4_human./blob/main/images/Screen%20Shot%202021-06-07%20at%2010.36.34.png)
