setwd("C://LKG//MOOC//Exploratory Data Analysis//Week 1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

subSet_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSet_Data$Global_active_power)

hist(globalActivePower, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()