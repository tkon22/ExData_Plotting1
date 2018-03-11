hhpower <- {
  hpower <- "household_power_consumption.txt"
  hpdata <- read.table(hpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  hhpsubSetData <- data[hpdata$Date %in% c("1/2/2007","2/2/2007") ,]
}
#hhstr(hhpsubSetData)
datetime <- strptime(paste(hhpsubSetData$Date, hhpsubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hhpGlobalActivePower <- as.numeric(hhpsubSetData$Global_active_power)
hhpGlobalreActivePower <- as.numeric(hhpsubSetData$Global_reactive_power)
voltage <- as.numeric(hhpsubSetData$Voltage)
hhpsubMeter1 <- as.numeric(hhpsubSetData$Sub_metering_1)
hhpsubMeter2 <- as.numeric(hhpsubSetData$Sub_metering_2)
hhpsubMeter3 <- as.numeric(hhpsubSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, hhpGlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, hhpsubMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, hhpsubMeter2, type="l", col="red")
lines(datetime, hhpsubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, hhpGlobalreActivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()