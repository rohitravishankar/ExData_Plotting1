plot3 <- function() {
	directory <- "C:/Users/rohit.ravishankar/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
	data <- read.table(directory, header = T, sep = ";", stringsAsFactors = F)
	subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

	day <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 
	globalActivePower <- as.numeric(subsetData$Global_active_power)
	subMetering1 <- as.numeric(subsetData$Sub_metering_1)
	subMetering2 <- as.numeric(subsetData$Sub_metering_2)
	subMetering3 <- as.numeric(subsetData$Sub_metering_3)


	png("plot3.png", width=480, height=480)
	plot(day, subMetering1, type="l", ylab="Energy Submetering", xlab="")
	lines(day, subMetering2, type="l", col="red")
	lines(day, subMetering3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
	dev.off()#newly addded

}