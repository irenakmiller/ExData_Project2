## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 2


## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## read data
NEI <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")

##  get Baltimore emissions
emissionsBaltimore <- subset(NEI, fips == 24510)

##  Gather/Aggregate total emissions from 1999 to 2008 for Baltimore
emissionTotals <- aggregate(Emissions ~ year, emissionsBaltimore, sum)

##  Create plot2.png
png('plot2.png')

## create base plot
with(emissionTotals, plot(emissionTotals$year, (emissionTotals$Emissions/1000), 
                          xlab = "Year", ylab = expression("Total PM"[2.5]*" Emission (thousands of tons)"), xaxt="n", "b"))
title(main = expression("Total Baltimore PM"[2.5]*" Emissions"))
axis(side=1, at=c("1999", "2002", "2005", "2008"))

dev.off()