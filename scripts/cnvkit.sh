## Versions
# CNVkit version 0.9.7.dev0

## Variables
# path=file path for cnvkit.py
# MHS.bam=bam file of MHS sample to be used
# MHN.bam=bam file of MHN sample to be used, this is left blank if there is no MHN sample to use
# WEStargets.bed=target region bed file for WES kit used
# reference.fasta=genome reference fasta (hg38 for all alignments in this project)
# outputref.cnn=output coverage for reference
# directory=directory path for output files

# CNVkit batch for identification of CNVs with a normal (MHN) and disease (MHS) sample
python3 ${path}/cnvkit.py batch $MHS.bam --normal $MHN.bam --targets $WEStargets.bed --fasta $reference.fasta --output-reference $outputref.cnn --output-dir $directory
