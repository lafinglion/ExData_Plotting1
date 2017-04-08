# Read data set
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetData <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Convert Date and Time variables
datetime <- paste(subsetData$Date, subsetData$Time, sep = " ")
DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Convert to numeric values
GAP <- as.numeric(subsetData$Global_active_power)
Voltage <- as.numeric(subsetData$Voltage)
subMeter1 <- as.numeric(subsetData$Sub_metering_1)
subMeter2 <- as.numeric(subsetData$Sub_metering_2)
subMeter3 <- as.numeric(subsetData$Sub_metering_3)
GRP <- as.numeric(subsetData$Global_reactive_power)

# Make plot and create file
par(mfrow=c(2,2))

plot(DateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(DateTime, subMeter1, type = "l", xlab = "", ylab="Energy sub metering")
lines(DateTime, subMeter2, type = "l", col="red")
lines(DateTime, subMeter3, type = "l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=0.5, bty="n", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DateTime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="./data/plot4.png", height=480, width=480)
dev.off()
