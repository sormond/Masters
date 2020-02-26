## Versions
# mosdepth version 0.2.3

## Variables
# $outputstem=stem name of output mosdepth files
# $sample.bamfile=bam file for measurement of coverage
# $sample.mosdepth.bed=mosdepth input bed file
# 

mosdepth $outputstem $sample.bamfile

# grab genomic regions with coverage of less than 15
awk '{ if ($4 < 15) { print } }' $sample.mosdepth.bed > $sample_lowcov.bed

# concatenate all sample beds, sort them by chromosome and position, and merge the bed file into a final all samples bed file
cat sample1_lowcov.bed sample2_lowcov.bed ... | sort -k1,1 -k2,2n | bedtools merge > allsamplesmerged.bed

# find intersecting genomic positions between all samples low coverage bed file and the WES kit target region
bedtools intersect -wo -a allsamplesmerged.bed -b targetregion.bed

# express the  
cat targetregion.bed | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}'
