## Versions
# samtools version 1.7
# picard version 2.8.1

## Variables
# reference.fasta=genome reference fasta (hg38 for all alignments in this project)
# path=file path to picard programme
# WES_kit_target.bed=WES kit target region bed
# WES_target_interval=Bedtools output interval file containing WES kit target regions
# reference_genome.dict=.dict file for genome reference created by samtools faidx
# sample.bam=sample bam file
# sample_output_hs_metrics.txt=CollectHsMetrics output metrics txt file

# samtools create .dict file for genome reference necessary for BedToIntervalList
samtools faidx reference.fasta

## picard BedToIntervalList for creation of picard-compatible interval files
java -jar ${path}picard.jar BedToIntervalList I=WES_kit_target.bed O=$WES_target_interval SD=$reference_genome.dict ~/MH/reference/GATK_Bundle/bwa/Homo_sapiens_assembly38.dict

## picard CollectHsMetrics for coverage measurements
java -jar ${path}picard.jar CollectHsMetrics I=$sample.bam O=$sample_output_hs_metrics.txt R=$reference.fasta BAIT_INTERVALS=$WES_target_interval TARGET_INTERVALS=$WES_target_interval
