hhpower <- {
  hpower <- "household_power_consumption.txt"
  hpdata <- read.table(hpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  hhpsubSetData <- data[hpdata$Date %in% c("1/2/2007","2/2/2007") ,]
}
#hhstr(hhpsubSetData)
datetime <- strptime(paste(hhpsubSetData$Date, hhpsubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hhpGlobalActivePower <- as.numeric(hhpsubSetData$Global_active_power)
hhpsubMeter1 <- as.numeric(hhpsubSetData$Sub_metering_1)
hhpsubMeter2 <- as.numeric(hhpsubSetData$Sub_metering_2)
hhpsubMeter3 <- as.numeric(hhpsubSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, hhpsubMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, hhpsubMeter2, type="l", col="red")
lines(datetime, hhpsubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()