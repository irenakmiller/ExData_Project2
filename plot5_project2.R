## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 5


## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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

## find emissions for Baltimore City
vehicleEmissionsBaltimore <- subset(vehicleEmissions, fips == "24510")

## gather emissions and total by year
totalVehicleEmissionsBaltimore <- aggregate(Emissions ~ year, vehicleEmissionsBaltimore, sum)

## create a plot
ggplot(data = totalVehicleEmissionsBaltimore, aes(x = year, y = Emissions)) + 
        geom_line() + 
        geom_point( size = 4, shape = 23, fill = "blue") + 
        xlab("Year") + 
        ylab("Emissions (tons)") + 
        labs(title=expression("PM"[2.5]* " Motor Vehicle Emissions in Baltimore"))

## Save plot5
ggsave(file="plot5.png")
