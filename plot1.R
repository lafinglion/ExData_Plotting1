file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetData <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

GAP <- as.numeric(subsetData$Global_active_power)
hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file="./data/plot1.png", height=480, width=480)
dev.off()