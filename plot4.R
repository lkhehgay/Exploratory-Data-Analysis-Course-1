setwd("C://LKG//MOOC//Exploratory Data Analysis//Week 1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet_Data$Date, subSet_Data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subSet_Data$Global_active_power)
subMetering1 <- as.numeric(subSet_Data$Sub_metering_1)
subMetering2 <- as.numeric(subSet_Data$Sub_metering_2)
subMetering3 <- as.numeric(subSet_Data$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 
voltage <- as.numeric(subSetData$Voltage) 

##par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
##par(mfrow=c(2,2))

plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
##legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()