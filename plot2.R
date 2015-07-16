plot2 <- function() {
	directory <- "C:/Users/rohit.ravishankar/Desktop/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
	data <- read.table(directory, header = T, sep = ";", stringsAsFactors = F)
	subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

	day <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 
	globalActivePower <- as.numeric(subsetData$Global_active_power)
	png("plot2.png", width=480, height=480)
	plot(day, globalActivePower, xlab="", ylab="Global Active Power (kilowatts)", type='l')
	dev.off()
}