#
# Function to create a plot of global Active Power...
#

#t <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
#
# Get the subset of data we want to work with
#
x <- subset(t, Date == "2/2/2007" | Date == "1/2/2007")
#
# Convert to numeric.
#
xx <- as.numeric(x$Global_reactive_power)
g_range <- range(0, xx)
#
# Plot as line plot and remove the axes and annotations so that we can do this ourselves
#
plot(xx, type="l", axes=FALSE, ann=FALSE)
#
# out our axis annotations in place
#
axis(1, at=c(0,1500,2800), labels =c("Thu", "Fri", "Sat"))
axis(2, las=1, at=c(0, .1, .2, .3, .4, .5))
#
# Y-axis label
#
title( ylab="Global_reactive_power")
#
# Put a box around it.
#
box()
