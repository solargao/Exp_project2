library(ggplot2)
library(dplyr)
setwd("F:/workbench/R/coursera/exploratory data analysis/project2")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
NEI_Baltimore<- subset(NEI,fips=="24510")
NEI_Baltimore_motor_Emission <- subset(NEI_Baltimore,type="ON-ROAD")
NEI_Baltimore_motor_Emission <- transmute(NEI_Baltimore_motor_Emission,year = year,Emissions = Emissions)
NEI_Baltimore_motor_Emission <- split(NEI_Baltimore_motor_Emission,NEI_Baltimore_motor_Emission$year)
NEI_Baltimore_motor_Emission <- lapply(NEI_Baltimore_motor_Emission,function(x) sum(x$Emissions))
NEI_Baltimore_motor_Emission <- as.list(NEI_Baltimore_motor_Emission)
year <- c("1999","2002","2005","2008")
#plot and save as png 
png(filename = "plot5.png", width = 480, height = 480)
plot(year,NEI_Baltimore_motor_Emission,ylab= "Emission" ,main="Motor Vehicle emission",xaxt="n",type = "l",lwd="2")
axis(1,at=c(1999,2002,2005,2008),labels = year)
dev.off()