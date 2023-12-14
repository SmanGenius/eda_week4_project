library(dplyr)
library(tidyverse)
library(ggplot2)


#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")


balt <-  subset(summ, fips=="24510") 

ppm_balt <- balt %>%
  group_by(year) %>%
  summarise(emission = sum(Emissions))

#plot q2
#plot(ppm_balt$year, ppm_balt$emission, type = "l", xlab = "Year", ylab ="Total Emmisions" )
png("plot2.png", width = 480, height = 480)
barplot(ppm_balt$emission,
        names= ppm_balt$year,
        xlab = "Year",
        ylab = "Emissions",
        main = "Baltimore Emission by Year",
        col = cols)
dev.off()


