plot3 <- function(){
  # Read in the data from file which is assumed to be in working dir
  data <- read.csv("household_power_consumption.txt", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), sep = ";")
  
  # Correctly format date
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  # Subset data to only look at 2 days
  startDate <- as.Date("2007/02/01")
  endDate <- as.Date("2007/02/02")
  relevantData <- subset(data, Date >= startDate & Date <= endDate)
  
  # Combine date and time column into single date time data type
  relevantData$DateTime<- strptime(paste(relevantData$Date, relevantData$Time), format = "%Y-%m-%d %H:%M:%S")
  
  # Create png containing line graph
  png(file = "plot3.png", width = 480, height = 480)
  plot(relevantData$DateTime, relevantData$Sub_metering_1, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "Energy sub metering", xlab = "")
  
  # Make second line graph on same axes
  par(new = TRUE)
  plot(relevantData$DateTime, relevantData$Sub_metering_2, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "", xlab = "", col = "red")
  
  # Make third line graph on same axes
  par(new = TRUE)
  plot(relevantData$DateTime, relevantData$Sub_metering_3, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "", xlab = "", col = "blue")
  
  # Add legend
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
  dev.off()
}