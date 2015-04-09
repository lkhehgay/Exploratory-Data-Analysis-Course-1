setwd("C://LKG//MOOC//Exploratory Data Analysis//Week 1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSet_Data$Global_active_power)
subMetering1 <- as.numeric(subSet_Data$Sub_metering_1)
subMetering2 <- as.numeric(subSet_Data$Sub_metering_2)
subMetering3 <- as.numeric(subSet_Data$Sub_metering_3)

plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()