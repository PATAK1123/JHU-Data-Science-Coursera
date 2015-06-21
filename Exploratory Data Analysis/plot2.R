plot2 <- function(){
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
  png(file = "plot2.png", width = 480, height = 480)
  plot(relevantData$DateTime, relevantData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}