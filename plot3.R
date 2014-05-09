install.packages("sqldf")
library(sqldf)

mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql("household_power_consumption.txt", sql = mySql, sep =";")

Date1 <- strptime(paste(myData$Date, myData$Time), format='%d/%m/%Y %H:%M:%S')

plot(Date1, myData$Sub_metering_1, col = "black", type ="l", xlab = "",
     ylab = "Energy Sub Metering")
points(Date1, myData$Sub_metering_2, col = "red", type = "l")
points(Date1, myData$Sub_metering_3, col = "blue", type = "l")

legend("topright", lty = 1, pt.cex=1, cex=0.8, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()