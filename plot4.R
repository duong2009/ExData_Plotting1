mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql("household_power_consumption.txt", sql = mySql, sep =";")

Date1 <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %H:%M:%S')

par(mfrow = c(2,2))
plot(Date1, myData$Global_active_power, type ="l", xlab = "",
     ylab = "Global Active Power (kilowatts)", cex.lab = 0.8)

plot(Date1, myData$Voltage, type ="l", xlab = "datetime",
     ylab = "Voltage", cex.lab = 0.8)

plot(Date1, myData$Sub_metering_1, col = "black", type ="l", xlab = "",
     ylab = "Energy Sub Metering", cex.lab = 0.8)
points(Date1, myData$Sub_metering_2, col = "red", type = "l")
points(Date1, myData$Sub_metering_3, col = "blue", type = "l")

legend("topright", bty = "n",  pt.cex = 1, cex = 0.8, lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Date1, myData$Global_reactive_power, type ="l", xlab = "datetime",
     ylab = "Global_reactive_power", cex.lab = 0.8)

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()