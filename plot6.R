library(ggplot2)
library(dplyr)
setwd("F:/workbench/R/coursera/exploratory data analysis/project2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
NEI_Baltimore_Los<- NEI[NEI$fips %in% c("24510","06037"),]


#plot and save as png
png(filename = "plot6.png", width = 480, height = 480)
NEI_Baltimore_Los$fips <- as.factor(NEI_Baltimore_Los$fips)
levels(NEI_Baltimore_Los$fips) <- c("Los Angeles","Baltimore")
qplot(year,Emissions,data=NEI_Baltimore_Los,facets = .~fips,geom = c("point","smooth"),method = "lm")
dev.off()
