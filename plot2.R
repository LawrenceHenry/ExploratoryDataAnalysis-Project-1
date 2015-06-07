#
# Function to create a plot of global Active Power...
#
# Must be run from the folder where the househod_power_consumption data file exists
#
# Simply source this script to generate the plot.
#

op <- par(mfrow=c(1,1))
t <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
#
# Get the subset of data we want to work with
#
x <- subset(t, Date == "2/2/2007" | Date == "1/2/2007")
#
# Convert to numeric.
#
xx <- as.numeric(x$Global_active_power)
g_range <- range(0, xx)
#
# Plot as line plot and remove the axes and annotations so that we can do this ourselves
#
plot(xx, type="l", axes=FALSE, ann=FALSE)
#
# out our axis annotations in place
#
axis(1, at=c(0,1500,2800), labels =c("Thu", "Fri", "Sat"))
axis(2, las=1, at=2*0:g_range[2])
#
# Y-axis label
#
title( ylab="Global Active Power (kilowatts)")
#
# Put a box around it.
#
box()
#
# Reset graphics back.
#
op <- par(mfrow=c(1,1))

#
# Output png
#

dev.copy(png, 'plot2.png')
dev.off()

