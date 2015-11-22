library(ggplot2)
setwd("F:/workbench/R/coursera/exploratory data analysis/project2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subset
NEI_Baltimore<- subset(NEI,fips=="24510")
NEI_Baltimore$type <- as.factor(NEI_Baltimore$type)

#plot and save as png
png(filename = "plot3.png", width = 480, height = 480)
qplot(year,Emissions,data=NEI_Baltimore,facets = .~type,geom = c("point","smooth"),method = "lm",ylim = c(0,100))
dev.off()
