## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 6

## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## load ggplot2 library
library(ggplot2)

## read data
NEI <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")

## Find any 'vehicles' in SCC
SCCvehicles <- grepl("vehicles", SCC$EI.Sector, ignore.case = TRUE)

## get a subset of those records
subsetSCCvehicles <- SCC[SCCvehicles,]$SCC

## match SCC up to NEI data
vehicleEmissions <- NEI[NEI$SCC %in% subsetSCCvehicles, ]

## get a subset of vehicles in Baltimore
vehiclesBaltimore <- subset(vehicleEmissions, fips == "24510")

##  add a column named city
vehiclesBaltimore$city <- "Baltimore City"

## get a subset of vehicles in LA
vehiclesLA <- subset(vehicleEmissions, fips == "06037")

##  add a column named city
vehiclesLA$city <- "Los Angeles County"

## combine the data for Baltimore and LA
vehiclesCombined <- rbind(vehiclesBaltimore, vehiclesLA)

## gather data to be plotted
combinedEmissions <- aggregate(Emissions ~ city + year, data = vehiclesCombined, sum)

## plot data
ggplot(combinedEmissions, aes(x = year, y = Emissions, group = city, color = city)) + 
        geom_line() + 
        geom_point( size = 3, shape = 23, fill="blue") + 
        xlab("Year") + 
        ylab("Emissions (tons)") +
        ggtitle("Vehicle PM2.5 Emissions Comparison: Baltimore vs. LA")

## Save plot6
ggsave(file="plot6.png")
