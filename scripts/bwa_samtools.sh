## Versions
# bwa mem version 0.7.17
# samtools version 1.7

## Variables
# INT=number of threads to use
# readgroup=read group for sample
# reference.fasta=genome reference fasta (hg38 for all alignments in this project)
# read1.fastq=1st pair fastq file
# read2.fastq=2nd pair fastq file
# alignment.sam=sam file name
# sorted.bam=output bam file name

# bwa mem for alignment
bwa mem -t $INT -v 3 -R "$readgroup" $reference.fasta $read1.fastq $read2.fastq > $alignment.sam

# samtools for bam file creation, sorting of bam and indexing of bam
samtools view -b $alignment.sam | samtools sort -o $sorted.bam
samtools index $sorted.bam
