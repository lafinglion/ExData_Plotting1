file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetData <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

datetime <- paste(subsetData$Date, subsetData$Time, sep = " ")
DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

subMeter1 <- as.numeric(subsetData$Sub_metering_1)
subMeter2 <- as.numeric(subsetData$Sub_metering_2)
subMeter3 <- as.numeric(subsetData$Sub_metering_3)

plot(DateTime, subMeter1, type = "l", xlab = "", ylab="Energy sub metering")
lines(DateTime, subMeter2, type = "l", col="red")
lines(DateTime, subMeter3, type = "l", col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="./data/plot3.png", height=480, width=480)
dev.off()