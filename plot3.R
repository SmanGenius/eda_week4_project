library(dplyr)
library(tidyverse)
library(ggplot2)


#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")


balt <-  subset(summ, fips=="24510") 

type_1 <- aggregate(Emissions ~ year+ type, balt, sum)

png("plot3.png", width = 480, height = 480)
ggplot(type_1, aes(year, Emissions, color = type))+
  geom_line()+
  xlab("Year")+
  ylab("Emissions")+
  ggtitle("Total Emissions by Year From 1999-2008")
dev.off() 