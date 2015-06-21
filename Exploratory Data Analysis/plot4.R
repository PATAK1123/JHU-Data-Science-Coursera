plot4 <- function(){
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
  
  # Create png containing 4 graphs
  png(file = "plot4.png", width = 480, height = 480)
  
  # Layout as 2 by 2 grid
  par(mfrow = c(2, 2))
  with(relevantData, {
    # Graph 1
    plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    
    # Graph 2
    plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    
    # Graph 3 (with legend)
    plot(relevantData$DateTime, relevantData$Sub_metering_1, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "Energy sub metering", xlab = "")
    par(new = TRUE)
    plot(relevantData$DateTime, relevantData$Sub_metering_2, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "", xlab = "", col = "red")
    par(new = TRUE)
    plot(relevantData$DateTime, relevantData$Sub_metering_3, type = "l", ylim=range(c(relevantData$Sub_metering_1, relevantData$Sub_metering_2, relevantData$Sub_metering_3)), ylab = "", xlab = "", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, bty = "n")
    
    # Graph 4
    plot(DateTime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
    })
  dev.off()
}