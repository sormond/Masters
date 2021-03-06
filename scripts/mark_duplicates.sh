## Versions
# picard version 2.8.1

## Variables
# path=file path for picard.jar executable
# read_name_regex= IF family contains WES from technology other than ILLUMINA, read_name_regex=READ_NAME_REGEX=null ELSE IF family contains WES from ILLUMINA only, leave blank
# sorted.bam=input bam file name
# marked_duplicates.bam=output bam with marked duplicates file name
# marked_duplicates.txt=output stats for marked duplicates

# picard MarkDuplicates for PCR-duplicate marking of bam alignments
java -jar ${path}picard.jar MarkDuplicates $read_name_regex I=${sorted.bam} O=${marked_duplicates.bam} M=${marked_duplicates.txt}
