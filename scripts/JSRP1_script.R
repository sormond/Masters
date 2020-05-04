#### JSRP1 G150A association study R script. Written by Shannon Ormond.

new_df_clean <- read.csv("JSRP1_association_data.csv", stringsAsFactors = FALSE)

## stats
### linear regression model Halothane only
lm1_halothane <- lm(formula = Halothane ~ T4826I.Status, data = subset(subset(new_df_clean, T4826I.Status != "n.d."), RE.digest.result != "NA"))
lm2_halothane <- lm(formula = Halothane ~ T4826I.Status + RE.digest.result, data = subset(new_df_2, T4826I.Status != "n.d."))
anova(lm1_halothane, lm2_halothane)

### linear regression model caffeine only
lm1_caffeine <- lm(formula = Caffeine ~ T4826I.Status, data = subset(subset(new_df_clean, T4826I.Status != "n.d."), RE.digest.result != "NA"))
lm2_caffeine <- lm(formula = Caffeine ~ T4826I.Status + RE.digest.result, data = subset(new_df_2, T4826I.Status != "n.d."))
anova(lm1_caffeine, lm2_caffeine)


## plots

library(ggplot2)

# without T4826I
jsrp1 <- ggplot(data = subset(subset(new_df_clean, T4826I.Status == "N"), RE.digest.result != "NA"), (aes(Halothane, Caffeine)))
jsrp1 + geom_point(aes(color = factor(RE.digest.result))) +   ggtitle("T4826I status negative") +
  labs(x="Halothane contracture", y = "Caffeine contracture", color="JSRP1 G150A genotype") + scale_color_brewer(palette="Dark2")

# with T4826I
jsrp1 <- ggplot(data = subset(subset(new_df_clean, T4826I.Status == "P"), RE.digest.result != "NA"), (aes(Halothane, Caffeine)))
jsrp1 + geom_point(aes(color = factor(RE.digest.result))) + ggtitle("T4826I status positive") +
  labs(x="Halothane contracture", y = "Caffeine contracture", color="JSRP1 G150A genotype") + scale_color_brewer(palette="Dark2")


# all samples
jsrp1 <- ggplot(data = subset(subset(new_df_clean, T4826I.Status != "n.d."), RE.digest.result != "NA"), (aes(Halothane, Caffeine)))
jsrp1 + geom_point(aes(color = factor(RE.digest.result))) + ggtitle("All samples") +
  labs(x="Halothane contracture (g)", y = "Caffeine contracture (g)", color="JSRP1 G150A genotype") + scale_color_brewer(palette="Dark2")
