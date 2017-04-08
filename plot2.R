# Read data set
file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetData <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Convert Date and Time variables
datetime <- paste(subsetData$Date, subsetData$Time, sep = " ")
DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# Make plot and create file
GAP <- as.numeric(subsetData$Global_active_power)
plot(DateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="./data/plot2.png", height=480, width=480)
dev.off()
