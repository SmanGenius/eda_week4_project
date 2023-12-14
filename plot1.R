library(dplyr)
library(tidyverse)
library(ggplot2)



#read and unzip files
zipFile <- "exdata_data_NEI_data.zip"
outdir <- "dataunzip"

unzip(zipFile, exdir=outdir)

list.files("dataunzip/ ")

#read tables
source <- readRDS("dataunzip/Source_Classification_Code.rds")
summ <- readRDS("dataunzip/summarySCC_PM25.rds")

#summarize the ppm decresing in each year
ppm_y <- summ %>%
  group_by(year) %>%
  summarise(emission = sum(Emissions))

#plot Q1
#plot(ppm_y$year, ppm_y$emission/1000, type = "l", xlab = "Year", ylab ="Total Emmisions/1000 " )

cols <- c("orange","cyan", "green", "yellow")


png(file = "plot1.png", width = 480, height = 480)
barplot(ppm_y$emission/1000,
        names = ppm_y$year,
        xlab = "Year",
        ylab = "Emission/1000",
        main = "Total Emissiones by Year",
        col = cols)
dev.off() 
