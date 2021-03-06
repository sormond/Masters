## Versions
# gatk version 4.1.3.0

## Variables
# INT=number of threads to use
# readgroup=read group for sample
# reference.fasta=genome reference fasta (hg38 for all alignments in this project)
# processedbam=bam file to be used
# output.g.vcf.gz=output gzipped gvcf

# gatk HaplotypeCaller
gatk --java-options "-Xmx4g" HaplotypeCaller --native-pair-hmm-threads $INT -R $reference.fasta -I $processedbam -O $output.g.vcf.gz -ERC GVCF

# gatk CombineGVCFs
gatk CombineGVCFs -R *reference.fasta --variant *individual_1.g.vcf.gz --variant *individual_2.g.vcf.gz -O *wholefamily.g.vcf.gz
