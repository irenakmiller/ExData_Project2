
## Exploratory Data Analysis - Johns Hopkins University/Coursera
## June 2015
## Project 2
## Plot 3



## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 
## plotting system to make a plot answer this question.

## load ggplot2 library
library(ggplot2)

## read data
NEI <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Desktop/Coursera Data Science Track/Exploratory Data Analysis/Project2/exdata-data-NEI_data/Source_Classification_Code.rds")

##  get Baltimore emissions, year, and type subset.
emissionsBaltimore <- subset(NEI, fips == 24510, c("Emissions", "year","type"))

##  create ggplot
g <- ggplot(data = emissionsBaltimore, aes(x = year, y = Emissions, fill=type))

g + geom_bar(stat="identity") +
        facet_grid(.~type) +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City by Type of Source")) +
        guides(fill=FALSE) +
        scale_x_continuous(breaks = seq(1999, 2008, 3))

##  create and save plot3.png
ggsave(file="plot3.png")
