
## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 4

## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999–2008?

## load ggplot2 library
library(ggplot2)

## read data
NEI <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")

##  Find coal combustion-related sources
coalPresent <- grepl('Coal', SCC$Short.Name, fixed = TRUE)
coalData <- SCC[coalPresent, ]

##  Connect coal combustion sources to emissions
coalEmissions <- NEI[(NEI$SCC %in% coalData$SCC), ]

##  Gather by year
coalEmissionTotals <- aggregate(Emissions ~ year, coalEmissions, sum)

## plot data
ggplot(data = coalEmissionTotals, aes(x = year, y = Emissions)) + 
        geom_line() + 
        geom_point( size = 4, shape = 23, fill = "blue") + 
        xlab("Year") + 
        ylab("Emissions (thousands of tons)") + 
        labs(title=expression("US Coal Combustion PM"[2.5]*" Emissions"))
      
## Save plot4
ggsave(file="plot4.png")