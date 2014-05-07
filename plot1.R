## This code loads the required data only and plots Global
## Active Power as a histogram and saves it as a png. 

## Set directory to where household_power_consumption.txt was saved to.
## Dear peer reviewer - you might have to change this if you are 
## planning to run the code.
setwd("~/Desktop/Coursera//2014_R_ExploratoryDataAnalysis/ExData_Plotting1/")

## Load sqldf package. 
## Dear peer reviewer, if you haven't installed sqldf, then please run
## install.packages('sqldf') first. 
require(sqldf)

## Read selected data. 
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header = TRUE, sep = ";")
## Make png
png("plot1.png", width = 480, height = 480, unit = "px")

## Plot the histogram
with(data, hist(Global_active_power, 
                main = "Global Active Power", 
                col = "red",
                xlab = "Global Active Power (kilowatts)",
                ylab = "Frequency"))

## Close graphics device
dev.off()

