library(ggplot2)
library(dplyr)
setwd("F:/workbench/R/coursera/exploratory data analysis/project2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subset
#SCC_selected <- subset(SCC,SCC.Level.One=="External Combustion Boilers")
CoalSCC <- as.character(SCC[grep("^fuel comb -(.*)- coal$",SCC$EI.Sector,ignore.case = T),]$SCC)
NEI_coal_combustion <- NEI[NEI$SCC %in% CoalSCC,]
NEI_coal_combustion <- transmute(NEI_coal_combustion,year = year,Emissions = Emissions)
NEI_coal_combustion <- split(NEI_coal_combustion,NEI_coal_combustion$year)
NEI_coal_combustion <- lapply(NEI_coal_combustion,function(x) sum(x$Emissions))
NEI_coal_combustion <- as.list(NEI_coal_combustion)
year <- c("1999","2002","2005","2008")
#plot and save as png
png(filename = "plot4.png", width = 480, height = 480)
plot(year,NEI_coal_combustion,ylab= "Emission" ,main="Coal combustion related emission",xaxt="n",type = "l",lwd="2")
axis(1,at=c(1999,2002,2005,2008),labels = year)
dev.off()