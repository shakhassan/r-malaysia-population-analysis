setwd("~/Desktop/data/")
getwd()

PopulationMalaysia2016=read.csv("Population by Age Group and Ethnic Group, Malaysia, 2000 - 2016.csv", header = TRUE, sep = ",")
class(PopulationMalaysia2016)

summary(PopulationMalaysia2016)

#subset : removing 'Total' row
PopulationMalaysia2016Subset <- PopulationMalaysia2016[1:17,]
# remove comma in population number
PopulationMalaysia2016SubsetTotalF <- gsub(",","",PopulationMalaysia2016Subset$Total.Malaysian.citizens)
#y axis : order population
#PopulationMalaysia2016SubsetTMCOrder <- factor(PopulationMalaysia2016SubsetTotalF, levels = levels(factor(PopulationMalaysia2016SubsetTotalF)), ordered = TRUE )

#non CBF
library("ggplot2")
ggplot(PopulationMalaysia2016[1:17,], aes(x=PopulationMalaysia2016Subset$Age, y=PopulationMalaysia2016SubsetTotalF, fill=PopulationMalaysia2016Subset$Age)) + geom_bar(stat="identity") + labs(list(title="Population Malaysia Citizen : 2016 (Est)", x="Age", y="Population")) + scale_fill_discrete(name="Age")

#color blind friendly (CBF) palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#009E73")
#PopulationMalaysia2016SubsetTotalFNumeric <- as.numeric(PopulationMalaysia2016SubsetTotalF)
ggplot(PopulationMalaysia2016[1:17,], aes(x=PopulationMalaysia2016Subset$Age, y=PopulationMalaysia2016SubsetTotalF, fill=PopulationMalaysia2016Subset$Age)) + geom_bar(stat="identity") + labs(list(title="Population Malaysia Citizen : 2016 (Est)", x="Age", y="Population")) + scale_fill_manual(values=cbPalette) + guides(fill=guide_legend(title="Age (CBF)"))

#Exploratory Data Analysis
VotingEst <- sum(as.numeric(PopulationMalaysia2016SubsetTotalF[6:17]))

PopulationMalaysia2016SubsetTotalFOrder <- reorder(PopulationMalaysia2016SubsetTotalF, -PopulationMalaysia2016SubsetTotalF)

