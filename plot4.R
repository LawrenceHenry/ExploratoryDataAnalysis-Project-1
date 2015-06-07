#
# Build 4 plots on one page...
#
# To invoke:
#   Source this script, then invoke plot4() to get the 4 plots generated.
#
# Must be run from the folder where the househod_power_consumption data file exists
#
#
plot4 = function() {
  t <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")
  #
  # Get the subset of data we want to work with
  #
  x <- subset(t, Date == "2/2/2007" | Date == "1/2/2007")
  op <- par(mfrow=c(2,2))
  plot2(x)
  voltage_plot(x)
  plot3(x)
  GReactive(x)
  #
  # Reset the graphic to previous settings
  #
  par(op)
  #
  # Output png
  #
  dev.copy(png, 'plot4.png')
  dev.off()
  
}
 voltage_plot = function(x) {
 
   xx <- as.numeric(x$Voltage)
   g_range <- range(0, xx)
   #
   # Plot as line plot and remove the axes and annotations so that we can do this ourselves
   #
   plot(xx, type="l", axes=FALSE, ann=FALSE)
   #
   # out our axis annotations in place
   #
   axis(1, at=c(0,1500,2800), labels =c("Thu", "Fri", "Sat"))
   axis(2, las=1, at=c(234, 238, 242, 246))
   #
   # Y-axis label
   #
   title( ylab="Voltage")
   #
   # Put a box around it.
   #
   box()
   
 }
 
 GReactive = function(x) { 
 
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
   
   }

plot2 = function(x) {
 
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
  title( ylab="Global Active Power")
  #
  # Put a box around it.
  #
  box()
  
}

plot3 = function(x) {

  #
  # Convert information we need to numeric
  #
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
  legend(1000, g_range[2], 
         c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         cex=0.5, col=c("black", "blue","red"), lty=c(1,1,1), bty="n" )
  
  
}