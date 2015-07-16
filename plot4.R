plot4 <- function() {
	directory <- "C:/Users/rohit.ravishankar/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
	data <- read.table(directory, header = T, sep = ";", stringsAsFactors = F)
	subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

	#X axis for all the 4 graphs
	day <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

	#Y axis for the 1st graph
	globalActivePower <- as.numeric(subsetData$Global_active_power)

	#Y axis for the second graph
	voltage <- as.numeric(subsetData$Voltage)
	
	#Different lines on 3rd graph	
	subMetering1 <- as.numeric(subsetData$Sub_metering_1)
	subMetering2 <- as.numeric(subsetData$Sub_metering_2)
	subMetering3 <- as.numeric(subsetData$Sub_metering_3)

	#Y axis for the 4th graph
	globalReactivePower <- as.numeric(subsetData$Global_reactive_power)

	png("plot4.png", width=480, height=480)
	par(mfrow = c(2, 2))	
	
	
	#plot for the 1st graph
	plot(day, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex =0.2)

	#plot for the 2nd graph
	plot(day, voltage, type="l", xlab="datetime", ylab="Voltage")

	#plot for the 3rd graph
	plot(day, subMetering1, type="l", ylab="Energy Submetering", xlab="")
	lines(day, subMetering2, type="l", col="red")
	lines(day, subMetering3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

	#plot for the 4th graph
	plot(day, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

	dev.off()
}