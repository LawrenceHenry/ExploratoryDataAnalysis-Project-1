#
# Function to create a plot of Energy Sub Metering...
#
# Simply source this script and it will generate the plot
#
# Must be run from the folder where the househod_power_consumption data file exists
#
#
#
# Set to one graphic...
#
op <- par(mfrow=c(1,1))
#
# Read the data
#
t <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")

#
# Get the subset of data we want to work with
#
x <- subset(t, Date == "2/2/2007" | Date == "1/2/2007")
#
# Convert to numeric.
#
#xx <- as.numeric(x$Global_active_power)
s1 <- as.numeric(x$Sub_metering_1)
s2 <- as.numeric(x$Sub_metering_2)
s3 <- as.numeric(x$Sub_metering_3)

g_range <- range(0, s1)
#
# Plot as line plot and remove the axes and annotations so that we can do this ourselves
#
plot(s1, type="l", axes=FALSE, ann=FALSE)

# Graph sub_metering 2 with red  line 
lines(s2, type="l", col="red")
lines(s3, type="l", col="blue")

#
# out our axis annotations in place
#
axis(1, at=c(0,1500,2800), labels =c("Thu", "Fri", "Sat"))
axis(2, las=1, at=10*0:g_range[2])
#
# Y-axis label
#
title( ylab="Energy sub metering")
#
# Put a box around it.
#
box()

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(1850, g_range[2], 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       cex=0.8, col=c("black", "blue","red"), lty=c(1,1,1) )

#
# Reset graphics back.
#
op <- par(mfrow=c(1,1))

#
# Output png
#

dev.copy(png, 'plot3.png')
dev.off()
