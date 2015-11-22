library(dplyr)
setwd("F:/workbench/R/coursera/exploratory data analysis/project2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subset
NEI_Baltimore<- subset(NEI,fips=="24510")
Emission_Baltimore <- transmute(NEI_Baltimore,Emissions=Emissions,year=year)
Emission_Baltimore_year <- split(Emission_Baltimore,Emission_Baltimore$year)
Emission_Baltimore_year <- lapply(Emission_Baltimore_year,function(x) sum(x$Emissions))
Emission_Baltimore_year <- as.list(Emission_Baltimore_year)
#plot and save as png
png(filename = "plot2.png", width = 480, height = 480)
data <- cbind(year=c(1999,2002,2005,2008),Emission=Emission_Baltimore_year)
plot(data ,type = "l",lwd="2",xaxt="n")
axis(1,at=c(1999,2002,2005,2008),labels = c("1999","2002","2005","2008"))
dev.off()

