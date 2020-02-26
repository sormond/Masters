## Versions
# mosdepth version 0.2.3
# bedtools version 2.29.0

## Variables
# outputstem=stem name of output mosdepth files
# sample.bam=sample bam file to be used for measurement of coverage
# sample.mosdepth.bed=mosdepth-generated input bed file
# sample_lowcov.bed=mosdepth bed file with genomic positions with less than 15 read coverage
# allsamplesmerged.bed=coverage bed file containing all samples to be analysed
# targetregion.bed=WES kit target region bed file


# mosdepth collect coverage stats
mosdepth $outputstem $sample.bam

# get genomic regions with coverage of less than 15
awk '{ if ($4 < 15) { print } }' $sample.mosdepth.bed > $sample_lowcov.bed

# concatenate all sample beds, sort them by chromosome and position, and merge the bed file into a final all samples bed file
cat $sample1_lowcov.bed $sample2_lowcov.bed ... | sort -k1,1 -k2,2n | bedtools merge > $allsamplesmerged.bed

# find intersecting genomic positions between all samples low coverage bed file and the WES kit target region and express in bases
bedtools intersect -wo -a $allsamplesmerged.bed -b $targetregion.bed | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$9 }END{print SUM}'

# get the total bases of the target region bed file 
cat $targetregion.bed | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}'
