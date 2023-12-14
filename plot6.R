library(dplyr)
library(tidyverse)
library(ggplot2)


#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")

LA_and_bal <-  subset(summ, fips=="06037" | fips=="24510") 
vehicle <- grep("Veh", source$Short.Name)

vehicle1 <- source[vehicle,]


vehicle2 <- merge(vehicle1,LA_and_bal, by.x = "SCC", by.y = "SCC")




bal_la <- aggregate(Emissions ~ year+fips, vehicle2, sum)

bal_la$fips <- replace(bal_la$fips, bal_la$fips == "06037", "Los Angeles")
bal_la$fips <- replace(bal_la$fips, bal_la$fips == "24510", "Baltimore")

png("plot6.png", width = 480, height = 480)
ggplot(bal_la, aes(year, Emissions, color = fips,))+
  geom_line()+
  xlab("Year")+
  ylab("Emissions")+
  ggtitle("Emissions batimore vs L.A. Year From 1999-2008")
dev.off()
