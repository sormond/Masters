## ggplot2 version 3.2.1
# input is picard's CollectHsMetrics output with manually added "Year" column containing year in which WES was carried out

library("ggplot2")
cov_dataframe <- read.csv("~/family.csv", na.string = c(""), colClasses = c("character", rep(NA, 57)))

## family mean coverage
pdf('~/family_mean_cov.pdf')
MEAN_TARGET_COV_PLOT_A <- ggplot(subset(cov_dataframe, Family == "family"), aes(x = Sample, y = MEAN_TARGET_COVERAGE, fill = as.factor(Year))) +
  geom_bar(stat="identity") +
  geom_text(aes(label=Sample), vjust=-0.5) +
  labs(x="WES Sample", y = "Average Target Depth (reads)", fill="Year") +
  ggtitle("Average Target Coverage") +
  scale_y_continuous(limits = c(0,max(subset(cov_dataframe, Family == "family")[,"MEAN_TARGET_COVERAGE"])*1.05)) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
plot(MEAN_TARGET_COV_PLOT_A)
dev.off()


## family percent low coverage
pdf('~/family_low_cov.pdf')
PCT_LOW_COV_PLOT_family <- ggplot(subset(cov_dataframe, Family == "family"), aes(x = Sample, y = (1 - PCT_TARGET_BASES_10X) * 100, fill = as.factor(Year))) +
  geom_bar(stat="identity") +
  geom_text(aes(label=Sample), vjust=-0.5) +
  labs(x="WES Sample", y = "% Bases with < 10X Coverage", fill="Year") +
  ggtitle("Proportion of Target Bases with Low Coverage") +
  scale_y_continuous(limits = c(0,1.02 * (100 - (min(subset(cov_dataframe, Family == "family")[,"PCT_TARGET_BASES_10X"])* 100)))) +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
plot(PCT_LOW_COV_PLOT_family)
dev.off()
