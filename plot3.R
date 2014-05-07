## This code will read the required data, make a plot of energy sub metering
## 1 through 3 across "3" days (Thu, Fri, Sat), save it as png. 

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

## Add a variable that codes weekday/
data$Weekday <- strftime(as.Date(data$Date, format = "%d/%m/%Y"), '%A')

## Make png
png("plot3.png", width = 480, height = 480, unit = "px")

## Plot 1st variable of interest, but without axis labels
plot(data$Sub_metering_1, type = "n", xaxt = "n", ann = F)

## Add data to plot
lines(data$Sub_metering_1, col = "black")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")

## Add x axis labels
axis(1, labels = c("Thu", "Fri", "Sat"), 
     at = c(1, 1440, 2880))

## Add y axis label
mtext("Energy sub metering", side = 2, line = 2.75)

## Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))

## Close graphics device
 dev.off()
