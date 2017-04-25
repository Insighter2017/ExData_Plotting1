#Exploratory Data Analysis
#Peer Review Project - Plot 3
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
	
#Frequency Plot (Plot 3): Multivariate frequency chart
		subMetering1 <- as.numeric(compactData$Sub_metering_1)
		subMetering2 <- as.numeric(compactData$Sub_metering_2)
		subMetering3 <- as.numeric(compactData$Sub_metering_3)

			png("plot3.png", width=480, height=480)

				plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
					lines(datetime, subMetering2, type="l", col="red")
					lines(datetime, subMetering3, type="l", col="blue")
					legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
	
			dev.off()