# Environmental Data Analytics Coding Challenge #1: Data Exploration

## The following code explores the EPA ECOTOX database entries for neonicotinoid mortality.
## The code contains numerous mistakes and errors, which you are tasked with fixing.
## Instructions listed in comments throughout the script.

#### Setup ----
setwd("/Users/YwJong/Documents/NSOE/Spring 2019/ENV 872 Environment Data Analytics/Labs/Data")

library("tidyverse")

ecotox.neonic <- read.csv("/Users/YwJong/Documents/NSOE/Spring 2019/ENV 872 Environment Data Analytics/Labs/Data/Raw/ECOTOX_Neonicotinoids_Mortality_raw.csv")

#### Basic Data Summaries ----
head(ecotox.neonic,5)
summary(ecotox.neonic$Chemical.Name)
summary(ecotox.neonic$Pub..Year)

# Fix formatting of column names (spaces originally present were turned to periods upon import)
colnames(ecotox.neonic)[8:12] <- c("Duration", "Conc.Type", "Conc.Mean", "Conc.Units", "Pub.Year")

# Plot histogram of counts of publication years
ggplot(ecotox.neonic) +
  geom_histogram(aes(x = Pub.Year))

# Plot histogram of counts chemical names
# hint: what is the class of Chemical.Name? There are two options for a solution.
#Method1
ggplot(ecotox.neonic) +
  geom_histogram(aes(x = Chemical.Name), stat="count")
#Method2 (still thinking)
#ggplot(ecotox.neonic) +
#  geom_histogram(aes(x = Chemical.Name),)
?geom_histogram
?ggplot
# Plot frequency polygon of publication years divided by chemical name
# Define colors as something other than ggplot default 
Plot <- ggplot(ecotox.neonic) +
  geom_freqpoly(aes(x = Pub..Year, color = Chemical.Name)) +
  theme(legend.position = "right")
# This line modify the colors of existing default color palette
Plot + scale_color_hue(l=40, c=35)
