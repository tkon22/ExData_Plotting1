hhpower <- {
  hpower <- "household_power_consumption.txt"
  hpdata <- read.table(hpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  hhpsubSetData <- data[hpdata$Date %in% c("1/2/2007","2/2/2007") ,]
}
#hhstr(hhpsubSetData)
datetime <- strptime(paste(hhpsubSetData$Date, hhpsubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hhpGlobalActivePower <- as.numeric(hhpsubSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, hhpGlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()