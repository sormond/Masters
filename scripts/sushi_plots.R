## Sushi version 1.22.0

library(Sushi)

### Family C Moi ###
cov_1474 = read.delim(file = "~/Desktop/mosdepth/Moi_1474_1273/1474/1474-mosdepth.per-base.bed")
cov_1273 = read.delim(file = "~/Desktop/mosdepth/Moi_1474_1273//1273/1273-mosdepth.per-base.bed")


## for chr22 dup analysis

chrom = "chr22"
chromstart = 42000000
chromend = 43000000

# to allow for zoom plots
layout(matrix(c(1,1,2,2),2, 2, byrow = TRUE))
par(mar=c(3,4,1,1))

# plot out file
pdf(file='~/Desktop/mosdepth/Moi_1474_1273/chr22/test.pdf', width=6.42, height=4.48) 

# make plots
plotBedgraph(cov_1273, chrom, chromstart, chromend, transparency=.20, color=SushiColors(2)(4)[4])
plotBedgraph(overlay=TRUE, cov_1474, chrom, chromstart, chromend, transparency=.20, color=SushiColors(2)(2)[1])
labelgenome(chrom,chromstart,chromend,n=4,scale="Kb")
axis(side=2,las=2,tcl=.2)
mtext("Read Depth",side=2,line=2.5,cex=1,font=2)
legend("topleft",inset=0.025,legend=c("1474","1273"),fill=opaque(SushiColors(2)(2)),border=SushiColors(2)(2),text.font=2,cex=1.0)

# add zoom region to plot
zoomregion1 = c(42500000,42560000)
zoomsregion(zoomregion1,offsets=c(0,0), wideextend=0.4)
plotBedgraph(cov_1273,chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2], transparency=.20, color=SushiColors(2)(4)[4])
plotBedgraph(overlay = TRUE, cov_1474,chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2], transparency=.20, color=SushiColors(2)(2)[1])
labelgenome(chrom,chromstart=zoomregion1[1],chromend=zoomregion1[2],n=6,scale="Kb",edgeblankfraction=0.2,cex.axis=.75)
zoombox()    
mtext("Read Depth",side=2,line=2.5,cex=1,font=2)
axis(side=2,las=2,tcl=.2)

# saves plot
dev.off()
