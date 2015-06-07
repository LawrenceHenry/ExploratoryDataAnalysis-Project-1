#
# Create Histogram for Global Active Power... limit on dates.
# Must be run from the folder where the househod_power_consumption data file exists
#
#

op <- par(mfrow=c(1,1))
t <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
x <- subset(t, Date == "2/2/2007" | Date == "1/2/2007")
hi <- hist( as.numeric( x$Global_active_power ), 
            breaks=11, col="red", 
            main="Global Active Power", 
            xlab="Global Active Power(kilowats)"
          )
par(op)

dev.copy(png, 'plot1.png')
dev.off()
