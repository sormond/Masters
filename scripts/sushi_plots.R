## Sushi version 1.22.0

library(Sushi)

# load in per base coverage bed files for MHN and MHS sample under CNV investigation
cov_MHN_sample = read.delim(file = "~/MHNsample_mosdepth.per-base.bed")
cov_MHS_sample = read.delim(file = "~/MHSsample_mosdepth.per-base.bed")

## chromosome and start and end positions containing potential CNV of interest
chrom = "chr" ## e.g. chr5
chromstart = start ## e.g. 7900000
chromend = end ## e.g. 8100000

# to allow for zoom plots
layout(matrix(c(1,1,2,2),2, 2, byrow = TRUE))
par(mar=c(3,4,1,1))

# plot out file
pdf(file='~/chromosome_cnv.pdf', width=6.42, height=4.48) 

# make plots
plotBedgraph(cov_MHS_sample, chrom, chromstart, chromend, transparency=.20, color=SushiColors(2)(4)[4])
plotBedgraph(overlay=TRUE, cov_MHN_sample, chrom, chromstart, chromend, transparency=.20, color=SushiColors(2)(2)[1])
labelgenome(chrom,chromstart,chromend,n=4,scale="Kb")
axis(side=2,las=2,tcl=.2)
mtext("Read Depth",side=2,line=2.5,cex=1,font=2)
legend("topleft",inset=0.025,legend=c("MHN_sample","MHS_sample"),fill=opaque(SushiColors(2)(2)),border=SushiColors(2)(2),text.font=2,cex=1.0)

# add zoom region to plot
zoomregion1 = c(zoom_start_position,zoom_end_position)
zoomsregion(zoomregion1,offsets=c(0,0), wideextend=0.4)
plotBedgraph(cov_MHS_sample,chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2], transparency=.20, color=SushiColors(2)(4)[4])
plotBedgraph(overlay = TRUE, cov_MHN_sample,chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2], transparency=.20, color=SushiColors(2)(2)[1])
labelgenome(chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2],n=6,scale="Kb",edgeblankfraction=0.2,cex.axis=.75)
zoombox()    
mtext("Read Depth",side=2,line=2.5,cex=1,font=2)
axis(side=2,las=2,tcl=.2)

# saves plot
dev.off()
