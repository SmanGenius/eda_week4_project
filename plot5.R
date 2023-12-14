library(dplyr)
library(tidyverse)
library(ggplot2)


#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")

vehicle <- grep("Veh", source$Short.Name)

vehicle1 <- source[vehicle,]


vehicle2 <- merge(vehicle1,balt, by.x = "SCC", by.y = "SCC")

LA <-  subset(summ, fips=="06037") 

vehicle_LA <- merge(vehicle1,LA, by.x = "SCC", by.y = "SCC")

ggplot(vehicle_LA, aes(x = factor(year), y = Emissions, fill = type))+
  geom_bar(stat = "identity")

#Plot q5 y
png("plot5.png", width = 480, height = 480)
ggplot(vehicle2, aes(x = factor(year), y = Emissions, fill = type))+
  geom_bar(stat = "identity")+
  xlab("Year")+
  ylab("Emissions")+
  ggtitle("Emission from Vehicles (99-2008)")
dev.off()