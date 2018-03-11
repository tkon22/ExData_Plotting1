hhpower <- {
hpower <- "household_power_consumption.txt"
hpdata <- read.table(hpower, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hhpsubSetData <- data[hpdata$Date %in% c("1/2/2007","2/2/2007") ,]
}
#hhstr(subSetData)
hhpGlobalActivePower <- as.numeric(hhpsubSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(hhpGlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

