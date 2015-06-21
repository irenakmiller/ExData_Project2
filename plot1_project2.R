## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 1

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.



## read data
NEI <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")

##  Gather/Aggregate total emissions from 1999 to 2008
emissionTotals <- aggregate(Emissions ~ year, NEI, sum)

##  Create plot1.png
png('plot1.png')

with(emissionTotals, plot(emissionTotals$year, (emissionTotals$Emissions/1000), 
                          xlab = "Year", ylab = expression("Emissions PM"[2.5]*" (tons)"), xaxt="n", "b"))
title(main = expression("Total US PM"[2.5]*" Emissions"))
axis(side=1, at=c("1999", "2002", "2005", "2008"))


dev.off()


