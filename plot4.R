## Code will make a png with 4 separate plots.

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
png("plot4.png", width = 480, height = 480, unit = "px")

## There will be 4 plots. 
par(mfrow = c(2,2))

## Add top left plot. 
plot(data$Global_active_power, type = "n", xaxt = "n", ann = F)
lines(data$Global_active_power)
axis(1, labels = c("Thu", "Fri", "Sat"), 
     at = c(1, 1440, 2880))
mtext("Global Active Power", side = 2, line = 2.75)

## Add top right plot. 
plot(data$Voltage, type = "n", xaxt = "n", ann = F)
lines(data$Voltage)
axis(1, labels = c("Thu", "Fri", "Sat"),
     at = c(1, 1440, 2880))
mtext("datetime", side = 1, line = 2.75)
mtext("Voltage", side = 2, line = 2.75)

## Add lower left plot. 
plot(data$Sub_metering_1, type = "n", xaxt = "n", ann = F)
lines(data$Sub_metering_1, col = "black")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(1, labels = c("Thu", "Fri", "Sat"), 
     at = c(1, 1440, 2880))
mtext("Energy sub metering", side = 2, line = 2.75)
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"),
       bty = "n")

## Add lower right plot.
plot(data$Global_reactive_power, type = "n", xaxt = "n", ann = F)
lines(data$Global_reactive_power)
axis(1, labels = c("Thu", "Fri", "Sat"),
     at = c(1, 1440, 2880))
mtext("Global_reactive_power", side = 2, line = 2.75)
mtext("datetime", side = 1, line = 2.75)

## Close graphics device
dev.off()

