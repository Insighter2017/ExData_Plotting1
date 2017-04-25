#Exploratory Data Analysis
#Peer Review Project - Plot 1
#Coded by Shelby Brambach, 4/23/2017

#Read in the text using read.table.  Subset the data and free memory by removing the full data table.

	d1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
	compactData <- d1[d1$Date %in% c("1/2/2007","2/2/2007") ,]

#Variables used by all plot sequences
		datetime <- strptime(paste(compactData$Date, compactData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
		globalActivePower <- as.numeric(compactData$Global_active_power)
		globalReactivePower <- as.numeric(compactData$Global_reactive_power)
		voltage <- as.numeric(compactData$Voltage)
		subMetering1 <- as.numeric(compactData$Sub_metering_1)
		subMetering2 <- as.numeric(compactData$Sub_metering_2)
		subMetering3 <- as.numeric(compactData$Sub_metering_3)
	
#Cleanup RAM
	rm("d1")
	
#Histogram (Plot 1): Plot and write to png file
	
	png("plot1.png", width=480, height=480)
	hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
