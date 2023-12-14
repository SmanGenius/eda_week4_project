library(dplyr)
library(tidyverse)
library(ggplot2)


#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")


comb <- grep("Comb", source$EI.Sector)

source_1 <- source[comb,] 

comb_1 <- merge(source_1, summ, by.x = "SCC", by.y = "SCC")

comb_2 <- comb_1 %>%
  group_by(year) %>%
  summarise(emission = sum(Emissions))


#plot4 <- plot(comb_2$year, comb_2$emission, type = "l", xlab = "Year", ylab = "Emissions")

png("plot4.png", width = 480, height = 480)
barplot(comb_2$emission,
        names = comb_2$year,
        xlab = "Year",
        ylab = "Emissions",
        main = "Emission From Carbon ",
        col = cols)

dev.off()
